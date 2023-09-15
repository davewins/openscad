// bracket.scad
// library for parametric Holder, Clip, Grip, Hook, Hanger, Bracket
// Author: Tony Z. Tonchev, Michigan (USA) 
// last update: October 2018


// (in mm)
Clip_Diameter = 25;
Small_Clip_Diameter = 22.5;

// (in mm)
Clip_Thickness = 26.4;
Small_Clip_Thickness = 16.5;

/* [Hidden] */

$fn=100;

union() {
TZT_CLIP(Clip_Diameter, Clip_Thickness);
translate([-30,0,0]) rotate([0,180,0])
TZT_CLIP(Clip_Diameter, Clip_Thickness);
translate([-15,27,0]) rotate([90,0,90])
TZT_CLIP(Small_Clip_Diameter, Small_Clip_Thickness);
}

module TZT_CLIP (diameter,thickness) {
    TZT_Rad=diameter/2;
    TZT_Thk=thickness;
    difference () {
        union () {
            translate ([-TZT_Rad*1.1,0,0]) {
                difference () {
                    cube ([TZT_Rad*.6,TZT_Rad*2.2,TZT_Thk],true) ;
                    translate ([TZT_Rad*.2,TZT_Rad*1.07,0]) {
                        cylinder (TZT_Thk*1.1,TZT_Rad*.2,TZT_Rad*.2,true);
                    }
                    translate ([TZT_Rad*.2,-TZT_Rad*1.07,0]) {
                        cylinder (TZT_Thk*1.1,TZT_Rad*.2,TZT_Rad*.2,true);
                    }

                }
            }
            cylinder (TZT_Thk,TZT_Rad*1.2,TZT_Rad*1.2,true);
        }
        cylinder (TZT_Thk*4,TZT_Rad,TZT_Rad,true);
        translate ([TZT_Rad*1.3,0,0]) {
            cylinder (TZT_Thk+1,TZT_Rad,TZT_Rad,true);
        }
    }
    for (TZT_i=[-50:100:50]) {
        rotate ([0,0,TZT_i]) {
            translate ([TZT_Rad*1.1,0,0]) {
                cylinder (TZT_Thk,TZT_Rad*.2,TZT_Rad*.2,true);
            }
        }
    }
}