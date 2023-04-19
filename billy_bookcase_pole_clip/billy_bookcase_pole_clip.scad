// the thickness of the lines as as seen from above (don't recommend much more than 6 or the geometry gets messy)
thickness = 4;

// how high it will protrude from the build plate
width = 18;

// the length of the part that goes onto the shelf
length = 30;

// the shelf thickness
shelf = 20;

// how far it goes down below the bottom of the shelf (should be at least equal to thickness
hang = 5;

// diameter of hook bends
gap = 10;

// vertical part above the hook to prevent slipping off
tip = 5;

// width of the trough of the hook (wide U - positive number vs. semi-circle, 0)
trough = 30;

// (in mm)
Clip_Diameter = 13;

// (in mm)
Clip_Thickness = 18;

$fn=100;
TZT_Rad=Clip_Diameter/2;
TZT_Thk=Clip_Thickness;


module hook() {
  union() {
    // the part above the shelf
    translate([-length, 0, 0])
    cube([length, width, thickness]);

	 // the part below the shelf
      translate([-length, 0, -(shelf+thickness)])
	 cube([length, width, thickness]);

    // the part that goes down to the hook
    translate([0, 0, -shelf-thickness])
    cube([thickness, width, shelf+thickness*2]);

  }
}



module TZT_CLIP () {
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

rotate([90, 0, 0])
union() {
    hook();
    rotate([90, 0, 0]) translate([11,-10,-9]) TZT_CLIP();
}

