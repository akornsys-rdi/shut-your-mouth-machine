$fn=60;

box();

translate([180, 7, 19]) rotate([0, -90, 0]) pcb();
translate([184, 210, 20]) rotate([90, 0, -90]) sure_amplifier();
translate([11, 70, 8]) rotate([90, 0, 90]) power_supply();
translate([44.25, 13.25, 5]) rotate([180, 0, 180]) pir();
translate([100, 13, 43]) rotate([90, 0, 0]) potentiometer();
translate([85.9, -2.5, 94.25]) rotate([-90, 0, 0]) iec_c8();
translate([28.35, -2, 64.25]) rotate([-90, -90, 0]) switch();
translate([142, 130, 6]) rotate([0, 0, 90]) speaker();
translate([100, 67, 0]) rotate([180, 0, 0]) dome_button();

module box() {
    difference() {
        union() {
            //frontal
            union() {
                union() {
                    difference() {
                        union() {
                            translate([10, 12, 0]) cube([180, 101.5, 6]);
                        }
                        union() {
                            for(i=[16:17:170]) {
                                for(j=[15:16:100]) {
                                    translate([i, j, 3]) cube([15, 14, 4]);
                                }
                            }
                        }
                    }
                    translate([65.5, 12, 0]) cube([10, 10, 6]);
                    translate([124.5, 12, 0]) cube([10, 10, 6]);
                    translate([10, 83.5, 0]) cube([10, 10, 6]);
                    translate([180, 83.5, 0]) cube([10, 10, 6]);
                    translate([10, 12, 0]) cube([37, 30, 6]);
                }
                union() {
                    difference() {
                        union() {
                            translate([10, 113.5, 0]) cube([180, 101.5, 6]);
                        }
                        union() {
                            for(i=[16:17:180]) {
                                for(j=[118:16:200]) {
                                    translate([i, j, 3]) cube([15, 14, 4]);
                                }
                            }
                        }
                    }
                    translate([41, 205, 0]) cube([10, 10, 6]);
                    translate([148, 205, 0]) cube([10, 10, 6]);
                    translate([10, 133.5, 0]) cube([10, 10, 6]);
                    translate([180, 133.5, 0]) cube([10, 10, 6]);
                    translate([100, 172, 0]) difference() {
                        translate([-43, -43, 0]) cube([86, 86, 6]);
                        translate([0, 0, -1]) cylinder(r=38.5, h=8);
                    }
                }
            }
            
            //panel inferior
            union() {
                difference() {
                    translate([10, 0, 0]) cube([180, 12, 108]);
                    for(i= [5, 64, 123]) {
                        translate([i, 0, 0]) hull() {
                            translate([11, 4, 5]) cube([50, 8, 98]);
                            translate([8, 12, 2]) cube([56, 1, 104]);
                        }
                    }
                }
                difference() {
                    union() {
                        translate([163.4, 0, 64.35]) cube([14, 7, 25]);
                        translate([176.2, 0, 17]) cube([6, 10, 5]);
                        translate([176.2, 0, 87]) cube([6, 10, 5]);
                    }
                    translate([178.2, 6.5, 18.5]) cube([2, 4, 71]);
                    translate([171.2, 6.25, 63]) cube([9, 4, 26.5]);
                }
            }
            
            //trasera
            %translate([0, 0, 108]) cube([200, 215, 10]);
            
            //panel superior
            %translate([0, 215, 0]) cube([200, 10, 118]);
            
            //panel derecho
            %cube([10, 215, 108]);
            
            //panel izquierdo
            %translate([190, 0, 0]) cube([10, 215, 108]);
        }
        union() {
            //montaje
            union() {
                //lateral inferior
                translate([70.5, -0.5, 3.5]) rotate([-90, 0, 0]) screw_clearance();
                translate([129.5, -0.5, 3.5]) rotate([-90, 0, 0]) screw_clearance();
                //lateral superior
                translate([46, 225.5, 3.5]) rotate([90, 0, 0]) screw_clearance();
                translate([153, 225.5, 3.5]) rotate([90, 0, 0]) screw_clearance();
                //lateral derecho
                translate([-0.5, 6, 27]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 6, 81]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 88.5, 3.5]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 138.5, 3.5]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 148, 42]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 148, 75]) rotate([0, 90, 0]) screw_clearance();
                translate([-0.5, 74.5, 20.5]) rotate([0, 90, 0]) screw_clearance();
                //lateral izquierdo
                translate([200.5, 6, 27]) rotate([0, -90, 0]) screw_clearance();
                translate([200.5, 6, 81]) rotate([0, -90, 0]) screw_clearance();
                translate([200.5, 88.5, 3.5]) rotate([0, -90, 0]) screw_clearance();
                translate([200.5, 138.5, 3.5]) rotate([0, -90, 0]) screw_clearance();
                translate([178, 123.375, 23.825]) rotate([0, 90, 0]) screw_clearance();
                translate([178, 123.375, 85.125]) rotate([0, 90, 0]) screw_clearance();
                translate([178, 206.125, 23.825]) rotate([0, 90, 0]) screw_clearance();
                translate([178, 206.125, 85.125]) rotate([0, 90, 0]) screw_clearance();
                translate([174, 88.35, 21.65]) rotate([0, 90, 0]) screw_clearance();
                translate([174, 88.35, 86.35]) rotate([0, 90, 0]) screw_clearance();
            }
            //mecanizado
            union() {
                //potenciometro    
                union() {
                    translate([100, 3, 43]) rotate([-90, 0, 0]) cylinder(r=10, h=4); //rebaje grosor
                    translate([90, 4, 25]) cube([20, 4, 18.5]);
                    translate([100, -1, 43]) rotate([-90, 0, 0]) cylinder(r=3.75, h=8); //eje
                    translate([92, 1, 43]) rotate([-90, 0, 0]) cylinder(r=1.75, h=3); //muesca
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
                    translate([87.75, -1, 80]) cube([24.5, 8, 12.5]);
                    translate([87, 2, 80]) cube([26, 8, 12.5]);
                }
                //SD
                union() {
                    translate([171.4, -1, 66.35]) cube([4, 8, 21]);
                    translate([169.4, 2, 66.35]) hull() {
                        cube([5, 3, 21]);
                        translate([-10, 0 -3]) cube([11, 1, 21]);
                    }
                }
                //PIR
                union() {
                    translate([34, -1, 10]) rotate([-90, 0 ,0]) cylinder(r=1.5, h=8);
                    translate([26, -1, 10]) rotate([-90, 0 ,0]) cylinder(r=1.5, h=8);
                    translate([16, 13.5, -1]) cube([24, 24, 8]);
                    translate([11.5, 13, 3.5]) cube([33, 25, 4]);
                }
                //pulsador dome
                union() {
                    translate([100, 67, -1]) cylinder(r=12.5, h=8);
                    translate([100, 67, 3]) cylinder(r=18, h=5);
                }
                //altavoz
                union() {
                    translate([100, 172, -1]) cylinder(r=38.5, h=8);
                    for(i=[[68.25, 140.25, -1], [131.75, 140.25, -1], [68.25, 203.75, -1], [131.75, 203.75, -1]]) {
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
    cylinder(r=1.25, h=24);
    translate() cylinder(r=3, h=4);
}