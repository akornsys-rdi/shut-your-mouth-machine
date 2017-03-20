$fn=60;

box();
*translate([0, 0, -4]) import("modelo-carlos.stl");

translate([160, 7, 19]) rotate([0, -90, 0]) pcb();
*translate([4, 70, 7]) rotate([90, 0, 90]) power_supply();
*translate([163, 210, 20]) rotate([90, 0, -90]) sure_amplifier();
*translate([40.25, 12.75, 5]) rotate([180, 0, 180]) pir();
*translate([85, 13, 43]) rotate([90, 0, 0]) potentiometer();
*translate([70.9, -2.5, 94.25]) rotate([-90, 0, 0]) iec_c8();
*translate([28.35, -2, 64.25]) rotate([-90, -90, 0]) switch();
*translate([127, 130, 6]) rotate([0, 0, 90]) speaker();
*translate([85, 67, 0]) rotate([180, 0, 0]) dome_button();

module box() {
    difference() {
        union() {
            //frontal
            *union() {
                union() {
                    difference() {
                        union() {
                            translate([6, 12, 0]) cube([158, 110.5, 6]);
                        }
                        union() {
                            translate([-1, 112, -0.75]) cube([180, 11, 4]);
                            for(i=[10:17:150]) {
                                for(j=[15:17:98]) {
                                    translate([i, j, 3]) cube([15, 15, 4]);
                                }
                            }
                        }
                    }
                    translate([54.5, 12, 0]) cube([10, 10, 10]);
                    translate([105.5, 12, 0]) cube([10, 10, 10]);
                    translate([6, 12, 0]) cube([37, 30, 6]);
                }
                union() {
                    difference() {
                        union() {
                            translate([6, 112.5, 0]) cube([158, 100.5, 6]);
                        }
                        union() {
                            translate([-1, 112, 2.75]) cube([180, 11, 4]);
                            for(i=[10:17:150]) {
                                for(j=[125:17:200]) {
                                    translate([i, j, 3]) cube([15, 15, 4]);
                                }
                            }
                        }
                    }
                    translate([34.5, 203, 0]) cube([10, 10, 10]);
                    translate([125.5, 203, 0]) cube([10, 10, 10]);
                    translate([85, 172, 0]) difference() {
                        translate([-43, -43, 0]) cube([86, 84, 6]);
                        translate([0, 0, -1]) cylinder(r=38.5, h=8);
                    }
                }
            }
            //trasera
            *union() {
                union() {
                    difference() {
                        union() {
                            translate([6, 12, 106]) cube([158, 110.5, 2]);
                            translate([6, 112, 105.25]) cube([158, 10.5, 2.75]);
                            translate([85, 30, 105]) hull() {
                                translate() cylinder(r=6, h=3);
                                translate([0, 10, 0]) cylinder(r=4, h=3);
                            }
                        }
                        translate([85, 30, 106]) union() {
                            translate([0, 0, -2]) cylinder(r=4.5, h=5);
                            hull() {
                                cylinder(r1=4.5, r2=2.25, h=3.1);
                                translate([0, 10, -3]) cylinder(r1=4.5, r2=2.25, h=3.1);
                            }
                            hull() {
                                cylinder(r=2.25, h=3.1);
                                translate([0, 10, 0]) cylinder(r=2.25, h=3.1);
                            }
                        }
                    }
                    translate([54.5, 12, 98]) cube([10, 10, 10]);
                    translate([105.5, 12, 98]) cube([10, 10, 10]);
                }
                union() {
                    difference() {
                        union() {
                            translate([6, 112.5, 106]) cube([158, 100.5, 2]);
                            translate([46, 112.5, 102]) cube([77, 15, 6]);
                            for(i = [[56, 190, 105], [113, 190, 105]]) {
                                translate(i) hull() {
                                    cylinder(r=6, h=3);
                                    translate([0, 10, 0]) cylinder(r=4, h=3);
                                }
                            }
                        }
                        union() {
                            translate([5, 112, 104.75]) cube([160, 11, 6]);
                            for(i = [[56, 190, 106], [113, 190, 106]]) {
                                translate(i) union() {
                                    translate([0, 0, -2]) cylinder(r=4.5, h=5);
                                    hull() {
                                        cylinder(r1=4.5, r2=2.25, h=3.1);
                                        translate([0, 10, -3]) cylinder(r1=4.5, r2=2.25, h=3.1);
                                    }
                                    hull() {
                                        cylinder(r=2.25, h=3.1);
                                        translate([0, 10, 0]) cylinder(r=2.25, h=3.1);
                                    }
                                }
                            }
                        }
                    }
                    translate([34.5, 203, 98]) cube([10, 10, 10]);
                    translate([125.5, 203, 98]) cube([10, 10, 10]);
                }
            }
            //panel inferior
            *difference() {
                translate([6, 0, 0]) cube([158, 12, 108]);
                for(i= [0, 51, 102]) {
                    translate([i, 0, 0]) hull() {
                        translate([11, 4, 5]) cube([46, 8, 98]);
                        translate([8, 12, 2]) cube([52, 1, 104]);
                    }
                }
            }
            //panel superior
            *mirror([0, 1, 0]) translate([0, -225, 0]) difference() {
                translate([6, 0, 0]) cube([158, 12, 108]);
                for(i= [0, 31.5, 61, 91, 122.5]) {
                    translate([i, 0, 0]) hull() {
                        translate([11, 4, 5]) cube([25.5, 8, 98]);
                        translate([8, 12, 2]) cube([31.5, 1, 104]);
                    }
                }
                for(i=[13:31:165]) { //X
                    for (j=[16:20:100]) { //Z
                        translate([i, -2, j]) rotate([-30, 0, 0]) hull(){
                            rotate([-90, 0, 0]) cylinder(r=2, h=18);
                            translate([20, 0, 0]) rotate([-90, 0, 0]) cylinder(r=2, h=18);
                        }
                    }
                }
            }
            //panel derecho
            *union() {
                union() {
                    difference() {
                        cube([6, 117.25, 108]);
                        union() {
                            for(i=[6:38:110]) {
                                translate([-1, 107.5, i]) cube([8, 11, 19]);
                            }
                            for(i=[10:25:95]) {
                                translate([3, i, 4]) cube([4, 20, 100]);
                            }
                        }
                    }
                    translate([0, 74.5, 19.5]) rotate([0, 90, 0]) cylinder(r=5, h=6);
                    translate([6, 55, 7]) cube([2, 5, 5]);
                    translate([6, 55, 100]) cube([2, 5, 5]);
                }
                translate([0, 108, 0]) union() {
                    difference() {
                        cube([6, 117.25, 108]);
                        union() {
                            for(i=[-13:38:110]) {
                                translate([-1, -1.5, i-0.5]) cube([8, 11, 20]);
                            }
                            for(i=[13:25:100]) {
                                translate([3, i, 4]) cube([4, 20, 100]);
                            }
                        }
                    }
                    translate([0, 40, 74]) rotate([0, 90, 0]) cylinder(r=5, h=6);
                    translate([0, 40, 41]) rotate([0, 90, 0]) cylinder(r=5, h=6);
                }
            }
            //panel izquierdo
            translate([164, 0, 0]) union() {
                union() {
                    difference() {
                        cube([6, 117.25, 108]);
                        union() {
                            for(i=[6:38:110]) {
                                translate([-1, 107.5, i]) cube([8, 11, 19]);
                            }
                            for(i=[10:25:95]) {
                                translate([-1, i, 4]) cube([4, 20, 100]);
                            }
                        }
                    }
                    #translate([-1, 88.35, 21.65]) rotate([0, 90, 0]) cylinder(r=1, h=7);
                    #translate([-1, 88.35, 86.35]) rotate([0, 90, 0]) cylinder(r=1, h=7);
                    translate([-2, 55, 7]) cube([2, 5, 5]);
                    translate([-2, 55, 100]) cube([2, 5, 5]);
                }
                *translate([0, 108, 0]) union() {
                    difference() {
                        cube([6, 117.25, 108]);
                        union() {
                            for(i=[-13:38:110]) {
                                translate([-1, -1.5, i-0.5]) cube([8, 11, 20]);
                            }
                            for(i=[13:25:100]) {
                                translate([-1, i, 4]) cube([4, 20, 100]);
                            }
                        }
                    }
                    translate([-1, 15.375, 23.875]) rotate([0, 90, 0]) cylinder(r=4, h=7);
                    translate([-1, 15.375, 85.125]) rotate([0, 90, 0]) cylinder(r=4, h=7);
                    translate([-1, 98.125, 23.875]) rotate([0, 90, 0]) cylinder(r=4, h=7);
                    translate([-1, 98.125, 85.125]) rotate([0, 90, 0]) cylinder(r=4, h=7);
                    translate([-2, 58, 7]) cube([2, 5, 5]);
                    translate([-2, 58, 100]) cube([2, 5, 5]);
                }
            }
        }
        union() {
            //montaje
            union() {
                //frente
                translate([45, 117.5, 10]) rotate([180, 0, 0]) screw_clearance();
                translate([85, 117.5, 10]) rotate([180, 0, 0]) screw_clearance();
                translate([125, 117.5, 10]) rotate([180, 0, 0]) screw_clearance();
                //trasera
                translate([56, 117.5, 98]) rotate([0, 0, 0]) screw_clearance();
                translate([113, 117.5, 98]) rotate([0, 0, 0]) screw_clearance();
                //lateral inferior
                translate([59.5, -0.5, 5]) rotate([-90, 0, 0]) screw_clearance();
                translate([110.5, -0.5, 5]) rotate([-90, 0, 0]) screw_clearance();
                translate([59.5, -0.5, 103]) rotate([-90, 0, 0]) screw_clearance();
                translate([110.5, -0.5, 103]) rotate([-90, 0, 0]) screw_clearance();
                //lateral superior
                translate([39.5, 225.5, 5]) rotate([90, 0, 0]) screw_clearance();
                translate([130.5, 225.5, 5]) rotate([90, 0, 0]) screw_clearance();
                translate([39.5, 225.5, 103]) rotate([90, 0, 0]) screw_clearance();
                translate([130.5, 225.5, 103]) rotate([90, 0, 0]) screw_clearance();
                //lateral derecho
                translate([-0.5, 5, 27]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 5, 81]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 220, 27]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 220, 81]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 148, 74]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 148, 41]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 74.5, 19.5]) rotate([0, 90, 0]) screw_clearance();
                translate([3, 112.25, -1]) cylinder(r=0.875, h=110);
                //lateral izquierdo
                translate([170.5, 5, 27]) rotate([0, -90, 0]) screw_clearance();
                translate([170.5, 5, 81]) rotate([0, -90, 0]) screw_clearance();
                translate([170.5, 220, 27]) rotate([0, -90, 0]) screw_clearance();
                translate([170.5, 220, 81]) rotate([0, -90, 0]) screw_clearance();
                translate([157, 123.375, 23.875]) rotate([0, 90, 0]) screw_clearance();
                translate([157, 123.375, 85.125]) rotate([0, 90, 0]) screw_clearance();
                translate([157, 206.125, 23.875]) rotate([0, 90, 0]) screw_clearance();
                translate([157, 206.125, 85.125]) rotate([0, 90, 0]) screw_clearance();
                translate([167, 112.25, -1]) cylinder(r=0.875, h=110);
            }
            //mecanizado
            union() {
                //potenciometro    
                union() {
                    translate([85, 3, 43]) rotate([-90, 0, 0]) cylinder(r=10, h=4); //rebaje grosor
                    translate([75, 4, 25]) cube([20, 4, 18.5]);
                    translate([85, -1, 43]) rotate([-90, 0, 0]) cylinder(r=3.75, h=8); //eje
                    translate([77, 1, 43]) rotate([-90, 0, 0]) cylinder(r=1.75, h=3); //muesca
                }
                //interruptor
                union() {
                    translate([30, -1, 65]) cube([14, 8, 30]);
                    translate([30, 3, 64]) cube([14, 4, 32]);
                }
                //LED encendido
                union() {
                    translate([37.25, -1, 98.5]) rotate([-90, 0 ,0]) cylinder(r=1.5, h=8);
                    translate([37.25, 3, 98.5]) rotate([-90, 0 ,0]) cylinder(r=2, h=4);
                }
                //conector alimentación
                union() {
                    translate([72.75, -1, 80]) cube([24.5, 8, 12.5]);
                    translate([72, 2, 80]) cube([26, 8, 12.5]);
                }
                //SD
                union() {
                    translate([150.4, -1, 66.25]) cube([5, 8, 21]);
                }
                //PIR
                union() {
                    translate([30, -1, 10]) rotate([-90, 0 ,0]) cylinder(r=1.5, h=8);
                    translate([22, -1, 10]) rotate([-90, 0 ,0]) cylinder(r=1.5, h=8);
                    translate([12, 13, -1]) cube([24, 24, 8]);
                    translate([7.5, 12.5, 3.5]) cube([33, 25, 4]);
                }
                //pulsador dome
                union() {
                    translate([85, 67, -1]) cylinder(r=12.5, h=8);
                    translate([85, 67, 3]) cylinder(r=18, h=5);
                }
                //altavoz
                union() {
                    translate([85, 172, -1]) cylinder(r=38.5, h=8);
                    for(i=[[53.25, 140.25, -1], [116.75, 140.25, -1], [53.25, 203.75, -1], [116.75, 203.75, -1]]) {
                        translate(i) cylinder(r=1, h=8);
                    }
                }
            }
        }
    }
}

module pcb() {
    difference() {
        union() {
            color("green") cube([70, 84, 1.6]);
            color("grey") translate([47.35, -0.6, 1.6]) cube([21, 21, 4.5]);
            color("lightgrey") translate([50.35, -0.85, 6.1]) cube([15, 15, 2]);
            color("blue") translate([10, 30, 1.6]) cube([43, 21.5, 15]);
        }
        union() {
            translate([2.65, 81.35, -1]) cylinder(r=1.25, h=3);
            translate([67.35, 81.35, -1]) cylinder(r=1.25, h=3);
        }
    }
}

module power_supply() {
    difference() {
        color("lightgrey") cube([129, 98, 38]);
        union() {
            translate([-1, 2, 9]) cube([11, 98, 30]);
            translate([4.5, 12.5, -1]) cylinder(r=1.75, h=11);
            translate([78, 34, -1]) cylinder(r=1.5, h=11);
            translate([78, 67, -1]) cylinder(r=1.5, h=11);
            translate([6.5, -1, 29]) rotate([-90, 0, 0]) cylinder(r=1.5, h=11);
            translate([32, -1, 19.5]) rotate([-90, 0, 0]) cylinder(r=1.5, h=11);
            translate([109, -1, 28.5]) rotate([-90, 0, 0]) cylinder(r=1.5, h=11);
            translate([109, -1, 10.5]) rotate([-90, 0, 0]) cylinder(r=1.5, h=11);
        }
    }
}

module sure_amplifier() {
    difference() {
        union() {
            color("grey") cube([90.5, 69, 1.6]);
            color("lightgrey") translate([65, 0, 0]) cube([10.3, 13.5, 12]);
            color("lightgreen") union() {
                translate([53,3,0]) cube([10, 10.5, 16]);
                translate([78.5, 44, 0]) cube([10.5, 10, 16]);
                translate([3, 30, 0]) cube([10.5, 10, 16]);
            }
            color("grey") translate([76.5, 29.5, 0]) cube([14, 10, 15]);
            color("lightgrey") translate([90.5, 34.5, 8]) rotate([0, 90, 0]) cylinder(r=4.25, h=9.25);
        }
        union() {
            translate([3.875, 3.875, -1]) cylinder(r=1.875, h=3);
            translate([86.625, 3.875, -1]) cylinder(r=1.875, h=3);
            translate([3.875, 65.125, -1]) cylinder(r=1.875, h=3);
            translate([86.625, 65.125, -1]) cylinder(r=1.875, h=3);
        }
    }
}

module pir() {
    difference() {
        union() {
            color("green") cube([32.5, 24.5, 1.2]);
            color("white") union() {
                translate([4.75, 0.75, 1.2]) cube([23, 23, 3.3]);
                difference() {
                    translate([16.25, 12.25, 4.5]) sphere(11.5);
                    translate([4.75, 0.75, -7]) cube([23, 23, 8]);
                }
            }
            color("orange") union() {
                translate([7, 1, -9]) cube([7, 5, 9]);
                translate([15, 1, -9]) cube([7, 5, 9]);
            }
            color("yellow") translate([12.25, 20, -8.5]) cube([8, 2.5, 8.5]);
        }
        union() {
            translate([2, 12.25, -1]) cylinder(r=1, h=3);
            translate([30.5, 12.25, -1]) cylinder(r=1, h=3);
        }
    }
}

module potentiometer() {
    difference() {
        union() {
            color("lightgrey") union() {
                cylinder(r=8.75, h=9.5);
                cylinder(r=3.5, h=24.5);
                translate([-8.75, -1.5, 0]) cube([1, 3,11.5]);
            }
            color("brown") translate([-7.75, -17.5, 5]) cube([15.5, 18.25, 2]);
        }
        union() {
            translate([-0.5, -3.5, 17.25]) cube([1, 7, 8]);
        }
    }
}

module iec_c8() {
    difference() {
        color("grey") union() {
            cube([28.2, 16, 2.5]);
            translate([4.35, 1.75, 0]) cube([19.5, 12.5, 22]);
            translate([1.85, 4.25, 0]) cube([24.5, 7.5, 22]);
        }
        union() {
            translate([9.95, 8, -1]) cylinder(r=4.1, h=11);
            translate([18.25, 8, -1]) cylinder(r=4.1, h=11);
        }
    }
}

module switch() {
    color("grey") union() {
        cube([31.5, 17.25, 2]);
        translate([0, 1.75, 0]) hull() {
            cube([31.5, 13.75, 8]);
            translate([4.5, 0, 0]) cube([22.5, 13.75, 18]);
        }
    }
    color("goldenrod") translate([7.25, 5.45, 18]) cube([8.5, 6.35, 9.5]);
    color("darkred") translate([15.75, 3.875, 0]) rotate([0, 25, 0]) translate([-10.25, 0, -4]) cube([20.5, 9.5, 10]);
}

module speaker() {
    difference() {
        union() {
            color("grey") union() {
                cube([84, 84, 3.5]);
                translate([42, 42, 3.5]) cylinder(r1=38.75, r2=30, h=21.5);
            }
            color("lightgrey") translate([42, 42, 25]) cylinder(r=32.7, h=17);
            color("brown") translate([27.5, 0, 10]) cube([29, 10, 12]);
        }
        union() {
            translate([42, 42, -0.1]) cylinder(r1=37.5, r2=12, h=13);
            translate([42, 42, -1]) difference() {
                cylinder(r=60, h=5);
                translate([0, 0, -1]) cylinder(r=49, h=7);
            }
            translate([42, 42, 0]) for(i= [45:90:360]) {
                rotate([0, 0, i]) translate([45, 0, -1]) cylinder(r=2.1, h=5);
            }
        }
    }
}

module dome_button() {
    color("grey") union() {
        cylinder(r=49.25, h=17.5);
        translate([0, 0, 17.5]) cylinder(r=49.25, r2=39.75, h=8);
        translate([0, 0, -16]) cylinder(r=12, h=16);
    }
    color("red") union() {
        translate([0, 0, 25.5]) cylinder(r=39.75, h=3.5);
        translate([0, 0, -4.4]) difference() {
            sphere(52);
            translate([-55, -55, -56.5]) cube([110, 110, 90]);
        }
    }
    color("white") {
        translate([0, 0, -14]) cylinder(r=17, h=10.5);
        translate([-14, -9.25, -37]) cube([38, 18.5, 21]);
    }
}

module screw_clearance() {
    cylinder(r=1.25, h=16);
    translate() cylinder(r=3, h=4);
}