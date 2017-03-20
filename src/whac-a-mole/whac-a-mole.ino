/*
 *  S H U T   Y O U R   M O U T H   M A C H I N E 
 *  
 *  Arturo Moya Villén
 *  
 *  Firmware, hardware, 3D: kwendenarmo
 *  Box assembly and support: Carlos Hernández
 */

/*
 * T O D O
 * 
 * arreglar FAIL
 * numero de archivos en carpetas??
 * extraños de repetición de audios y cambio
 */

/*
 * I / O
 */
#define SOFT_RX 2
#define SOFT_TX 3
#define BUSY 4
#define COUNTER 5
#define PIR 6
#define BTN_PUSH 7
#define PCB_LED 8
#define BTN_LED 9
#define CLIP A0
#define VOL A1
#define DEBUG A2

/*
 * E S T A D O S
 */
enum fsm {
    FAIL,           // No archivos/SD encontrada
    OFF,            // PIR no ve
    PLAYING,        // PIR ve, no pulsado, reproducción de audio
    PROCESS,        // Determinar cual es el siguiente estado
    SILENCE,        // Generar silencio de tiempo en variable
    BELL,           // Hacer sonar sirena
    WAITING         // Esperar a que acabe de reproducirse el sonido actual
};

enum fsm_wait {
    NO,             // No espera
    HEAD,           // Esperar a que empiece a reproducir
    PLAY,           // Esperar a que acabe de reproducir
    TAIL,           // Espera al final de la reproducción del archivo
    RET             // Audio finalizado, devuelve el control
};

/*
 * D E F I N E S
 */
#define repeatPushThreshold 5
#define playerBusyDelay 700
#define defaultThreshold 80
#define repeatThreshold 35
#define minimumBright 16
#define onBright 200
#define maximumBright 255
#define volumeThreshold 5
#define numShortSilences 3
#define numLongSilences 1

/*
 * GLOBAL VARIABLES
 */
unsigned char totalAudioFiles = 0;  // Folder '01'
unsigned char totalBellFiles = 0;   // Folder '02'

/*
 * I N C L U D E
 */
#include <SoftwareSerial.h>
#include <DFPlayer_Mini_Mp3.h>

SoftwareSerial playerSerial(SOFT_RX, SOFT_TX); // RX, TX (ARDUINO SIDE)

void setup () {
    pinMode(BUSY, INPUT);
    pinMode(COUNTER, OUTPUT);
    pinMode(BTN_PUSH, INPUT_PULLUP);
    pinMode(BTN_LED, OUTPUT);
    pinMode(PIR, INPUT);
    pinMode(PCB_LED, OUTPUT);
    pinMode(DEBUG, OUTPUT);
    pinMode(CLIP, INPUT);
    Serial.begin(115200);
    Serial.println(F("Iniciando"));
    playerInit();
    randomSeed(analogRead(A5));
    digitalWrite(PCB_LED, HIGH);
    Serial.println(F("Listo!\n"));
}

void loop () {
    const unsigned int shortSilence[numShortSilences] = {8000, 13000, 21000};   //posibles valores de silencios cortos
    const unsigned int longSilence[numLongSilences] = {60000}; //posibles valores de silencios largos
    static fsm currentState = OFF;
    static fsm returnState = OFF;   //estado desde el que es llamado WAITING
    static fsm_wait waitingState = NO;   //estados de espera posibles
    static boolean stateChange = true;
    static boolean PIR_State = false;
    static boolean playerVolumeChange = false;
    static unsigned char playerVolume = 0;
    static unsigned char playerVolumeNew = 0;
    static int currentVolume = 0;
    static int oldVolume = 0;
    static unsigned char nextAudio = random(1,totalAudioFiles);    //aleatorio al inicio de programa
    static unsigned char silenceThreshold = defaultThreshold;  //porcentaje para irse a silencio vs otro audio
    static unsigned char repeatPushCounter = 0; //contador de veces que se ha pulsado rápido
    static unsigned long silenceDuration = 0; //valor de millis en el que acaba el silencio (millis + duración del silencio)
    static unsigned long waitingPlayer = 0;   //valor de millis que 

    PIR_State = digitalRead(PIR);
    digitalWrite(DEBUG, PIR_State);
    if ((totalAudioFiles == 0) && (totalBellFiles == 0)) currentState = FAIL;
    else {
        if (PIR_State) {
            if (currentState == OFF) {
                stateChange = true;
                currentState = PLAYING;
            }
            currentVolume = analogRead(VOL);
            if ((currentVolume < (oldVolume - volumeThreshold)) || (currentVolume > (oldVolume + volumeThreshold))) {
                oldVolume = currentVolume;
                playerVolumeNew = map(oldVolume,0,1023,0,30);
            }
            if (playerVolume != playerVolumeNew) {
                playerVolume = playerVolumeNew;
                playerVolumeChange = true;
            }
        }
        else { // !PIR_State
            if (currentState != OFF) stateChange = true;
            currentState = OFF;
        }
    }
    switch (currentState) {
      case FAIL:
        digitalWrite(BTN_LED, (millis()>>6)%2);
        break;
      case OFF:
        digitalWrite(BTN_LED, LOW);
        mp3_stop();
        playerVolumeNew = 0;
        if (playerVolume != playerVolumeNew) {
            playerVolume = playerVolumeNew;
            playerVolumeChange = true;
        }
        break;
      case PLAYING:
        analogWrite(BTN_LED, minimumBright);
        returnState = PLAYING;
        waitingState = HEAD;
        stateChange = true;
        currentState = WAITING;
        mp3_play_file_in_folder(1, nextAudio);
        break;
      case SILENCE:
        digitalWrite(BTN_LED, LOW);
        mp3_stop();
        if (silenceDuration < millis()) {
            stateChange = true;
            currentState = PLAYING;
        }
        break;
      case BELL:
        digitalWrite(BTN_LED, LOW);
        mp3_play_file_in_folder(2, random(1, totalBellFiles));
        nextAudio = random(1,totalAudioFiles+1);
        returnState = BELL;
        waitingPlayer = millis() + playerBusyDelay;
        waitingState = HEAD;
        stateChange = true;
        currentState = WAITING;
        break;
      case PROCESS:
        // Ir a silencio
        if (random(1,101) <= silenceThreshold) {
            if (repeatPushCounter >= repeatPushThreshold) silenceDuration = millis() + longSilence[random(0,numLongSilences-1)];
            else silenceDuration = millis() + shortSilence[random(0,numShortSilences-1)];
            repeatPushCounter = 0;
            silenceThreshold = defaultThreshold;
            stateChange = true;
            currentState = SILENCE;
        }
        // Volver a reproducir audio
        else {
            repeatPushCounter++;
            silenceThreshold = repeatThreshold;
            stateChange = true;
            currentState = PLAYING;
        }
        break;
      case WAITING:
        if ((returnState == PLAYING) && (!digitalRead(BTN_PUSH)) && (currentState != BELL)) {
            stateChange = true;
            waitingState = NO;
            currentState = BELL;
        }
        switch (waitingState) {
          case NO:
            break;
          case HEAD:
            if (!digitalRead(BUSY)) {
                if (waitingState != PLAY) stateChange = true;
                waitingState = PLAY;
            }
            break;
          case PLAY:
            if (returnState == PLAYING) {
                if (!digitalRead(CLIP)) analogWrite(BTN_LED, random(onBright, maximumBright));
                else analogWrite(BTN_LED, minimumBright);
            }
            if (digitalRead(BUSY)) {
                waitingPlayer = millis() + playerBusyDelay;
                if (waitingState != TAIL) stateChange = true;
                waitingState = TAIL;
            }
            break;
          case TAIL:
            if (returnState == PLAYING) analogWrite(BTN_LED, minimumBright);
            if (waitingPlayer < millis()) {
                if (waitingState != RET) stateChange = true;
                waitingState = RET;
            }
            break;
          case RET:
            stateChange = true;
            waitingState = NO;
            if (returnState == BELL) currentState = PROCESS;
            if (returnState == PLAYING) {
                nextAudio++;
                if (nextAudio > totalAudioFiles) nextAudio = 1;
                currentState = PLAYING;
            }
            break;
        }
        break;
    }
    if (playerVolumeChange) {
        playerVolumeChange = false;
        Serial.print("Cambiado volumen a ");
        Serial.println(playerVolume);
        delay(5);
        mp3_set_volume(playerVolume);
    }
    if (stateChange) {
        stateChange = false;
        if (currentState == FAIL) Serial.println(F("Entrado en FAIL"));
        else if (currentState == OFF) Serial.println(F("Entrado en OFF"));
        else if (currentState == PLAYING) Serial.println(F("Entrado en PLAYING"));
        else if (currentState == PROCESS) Serial.println(F("Entrado en PROCESS"));
        else if (currentState == SILENCE) Serial.println(F("Entrado en SILENCE"));
        else if (currentState == BELL) Serial.println(F("Entrado en BELL"));
        else if ((currentState == WAITING) && (waitingState == HEAD)) Serial.println(F("Entrado en WAIT-HEAD"));
        else if ((currentState == WAITING) && (waitingState == PLAY)) {
            Serial.print(F("Entrado en WAIT-PLAY "));
            Serial.println(nextAudio);
        }
        else if ((currentState == WAITING) && (waitingState == TAIL)) Serial.println(F("Entrado en WAIT-TAIL"));
        else if ((currentState == WAITING) && (waitingState == RET)) Serial.println(F("Entrado en WAIT-RET"));
    }
}

void playerInit() {
    playerSerial.begin(9600);
    mp3_set_serial(playerSerial);
    delay(5);
    mp3_stop();
    delay(5);
    mp3_set_volume(0);
    mp3_get_folder_sum(1);
    totalAudioFiles = mp3_wait_folder_sum();
    Serial.print(totalAudioFiles);
    Serial.println(F(" audios de voz encontrados."));
    delay(5);
    mp3_get_folder_sum(2);
    totalBellFiles = mp3_wait_folder_sum() / 2;
    Serial.print(totalBellFiles);
    Serial.println(F(" bocinazos encontrados."));
}

