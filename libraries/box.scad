// --------------------------------------------------------------------------------------------------------------------------------
// ProjectBox source code for use with OpenSCAD 
// 
// OpenSCAD Project Box: Use as a template for your box or to start with OpenSCAD
// Started Off Of Procedural Project Box v1   Was called the CudaTox, 2017
//
// Added Mark-Toys Esp32 PCB with standoffs, USB jack hole, OLED display, panel holes
// All of these extras can be enabled or disabled with the do_ type variables
//
// This box supports the Esp32 board from Mark-Toys.com and my favorite I2C  1.3" OLED display
// Consider this an example template for getting started in OpenSCAD!
// My 3D printer can do fairly precise edges.  You may have to tweek things to fit.
//
// PCB and OLED display are placed relative to lower left standoff as seen in render
// You can resize the PCB or OLED display and then place it with one X-Y pair
// Because the lid is upside down keep in mind that left to right are inverted positions
//
// Enjoy!  make Stuff!   Mark Johnston

use <"Chamfer.scad">              //Allows window with slanted edges

// Inside open space and wall thickness in mm of the main box itself. 
inside_width  = 80;             //Inside open space in mm for the width
inside_length = 58;             //Inside open space in mm for the length
inside_height = 20;             //Inside open space in mm for the depth inside the box
wallThickness = 1.8;            //Wall thickness in mm
edgeRadius    = 1.5;            //Box rounding. 0=square,2=2mm. <= wall thickness

// Options for the Box are rendered if not set to 0  ---------------------------------
// If these are set to 1 then also set parameters for the components enabled
do_pcb_mounts = 1;              // PC Board Standoffs
do_lid_holes  = 1;              // Drill holes for controls in the lid
do_usb_hole   = 1;              // USB jack hole to put cable into a board
do_display    = 1;              // Hole for display (number is display type, 1=1.3" OLED)
// -----------------------------------------------------------------------------------

// A couple references useful to place items relative to center lines
center_X      = (inside_width/2) + wallThickness;   // Useful for centerline of width
center_Y      = (inside_length/2) + wallThickness;  // Useful for centerline of height
center_height = (inside_height/2) + wallThickness;  // Useful for centerline of height

// Paramters for the lid and general construction usage (some a bit obscure)
extra_lid_thickness = 0.5;      //Need to read the code to understand this, just leave it if not
lidThickness  = wallThickness + extra_lid_thickness;  // total lid thickness
lid_fit_tol   = 0.2;            //Smaller for tighter lid. Use 0.4 for loose
lid_lip_depth = 2;              //depth the lid lip drops into the main body
fnDflt        = 36;             //Quality. Number of segments to approximate circle
                                
// The 4-board standoffs in the call to 'standoff' 
pcbWidthEsp32 = 42;             // Mark-Toys Esp32 pcb
pcbLengthEsp32= 32;             // Mark-Toys Esp32 pcb
pcbWidthArNan = 41;             // Arduino Nano pcb
pcbLengthArNan= 15;             // Arduino Nano Pcb

pcbOriginX    = 7;              // X for first origin standoff (easily move entire 4 standoffs)
pcbOriginY    = 7;              // Y for first origin standoff (easily move entire 4 standoffs)
pcbWidth      = pcbWidthEsp32;  // spacing between PCB holes on one side
pcbLength     = pcbLengthEsp32; // spacing between PCB holes on one side
standoffDia   = 4;              // Diameter of each PCB standoff and other standoffs
holeM2p5      = 2.3;            // Hole size for M2.5 screw
holeM2p0      = 1.8;            // Hole size for M2.0 screw
pcbScrewHole  = holeM2p5;       // screw hole size for PCB screw
oledScrewHole = holeM2p5;       // Screw hole size for OLED display

// Parameters for hole in side for USB jack
usbSizeY      = 12;
usbSizeZ      = 8;
usbHoleYEsp32 = pcbOriginY + 23.5 - (usbSizeY/2);   // Place usb jack for Esp32
usbHoleYArNan = pcbOriginY +  7.5 - (usbSizeY/2);   // Place usb jack for Arduino Nano
usbHoleY      = usbHoleYEsp32;
usbHoleZ      = 4.5;

// OLED Display Hole and standoffs
// Win size and holes remain, just change oledOrigin values to move display
oledWinWidth  = 32;             // Side to side window size
oledWinHeight = 20;             // Top to bottom windown size
oledOriginX   = 45;             // Places OLED display with 1 corner standoff
oledOriginY   = inside_length - oledWinHeight - 11; // Places OLED display 1st standoff
oledHolesX    = 30;             // Distance between standoffs in X
oledHolesY    = 28.5;           // Distance between standoffs in X

outside_width = inside_width + wallThickness * 2;
outside_length = inside_length + wallThickness * 2;

//Standoff module will render 4 standoffs for a PC board
//
// height    Height of the standoff above the base
// diameter  Outer diameter 
// holeDia   Diameter of the hole in the standoff
// firstTX   X location of lower left first standoff center
// firstTY   Y location of lower left first standoff center
// firstTZ   Z location of base of the standoffs
// pcbWidth  X distance between centers of standoffs
// pcbLength Y distance between centers of standoffs
// fn        A quality number. # of segments to approximate circle shapes
//
module standoff(height, diameter, holeDia, firstTX, firstTY, firstTZ, 
           pcbWidth, pcbLength, fn=fnDflt){
    //Standoff 1
    difference(){
        translate([firstTX, firstTY, firstTZ])
            cylinder(h=height, d=diameter, $fn = fn);
        translate([firstTX, firstTY, firstTZ])
            cylinder(h=height, d=holeDia, $fn = fn);
    }
    //Standoff 2
    difference(){
        translate([firstTX+pcbWidth, firstTY, firstTZ])
            cylinder(h=height, d=diameter, $fn = fn);
        translate([firstTX+pcbWidth, firstTY, firstTZ])
            cylinder(h=height, d=holeDia, $fn = fn);
    }
    //Standoff 3
    difference(){
        translate([firstTX, firstTY+pcbLength, firstTZ])
            cylinder(h=height, d=diameter, $fn = fn);
        translate([firstTX, firstTY+pcbLength, firstTZ])
            cylinder(h=height, d=holeDia, $fn = fn);
    }
    //Standoff 4
    difference(){
        translate([firstTX+pcbWidth, firstTY+pcbLength, firstTZ])
            cylinder(h=height, d=diameter, $fn = fn);
        translate([firstTX+pcbWidth, firstTY+pcbLength, firstTZ])
            cylinder(h=height, d=holeDia, $fn = fn);
    }
}


// Form solid rounded box of outside dimensions
// x,y,z are outside dimensions of this solid box for the chassis
// r     This is a rounding factor to form rounded edges
module rounded_box(x,y,z,r){
    translate([r,r,r])
    minkowski(){
        cube([x-r*2,y-r*2,z-r*2]);
        sphere(r=r, $fs=0.1);
    }
}

// A non-translated USB jack hole expected to be at 0 X side along the Y-Z side
module microUsbHole(y, z) {
    rounded_box(6, y, z, 1.0);
}

// A rectangular hole for display that is offset from mounting hole origin
// This is for a 1.3" OLED display 
module oledWindowHole(oledOriginX, oledOriginY, oledWinWidth, oledWinHeight) {
    
    //Taper on the window which makes it more complex. 
    translate([oledOriginX-1.5,oledOriginY+5,-lidThickness-1]) 
        chamferCube([oledWinWidth+1, oledWinHeight+1, (lidThickness*2.5)], 
            chamfers = [[1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 0, 0]], 
            ch = 1, ph1 = 1, ph2 = undef, ph3 = undef, ph4 = undef, 
            sizeX = undef, sizeY = undef, sizeZ = undef, chamferHeight = undef, 
           chamferX = undef, chamferY = undef, chamferZ = undef);
    
    // Straight edges no taper
    //translate([oledOriginX-1.5,oledOriginY+5,0]) 
    //    rounded_box(oledWinWidth, oledWinHeight, lidThickness+1, 0.1);
}

// The standoffs for the OLED display. Needs to be separate
// 4 standoffs for m2.5 5mm long wood screws are placed with one hole's x,y
// All the parameters are globals but placement is with oledHolesX and oledHolesY
module oledStandoffs(oledOriginX, oledOriginY) {
    // OLED PC standoffs height, diameter, holedia, X1, Y1, Z1, pcbWidth, pcbLength, fn=quality
    standoff(2.5, standoffDia, oledScrewHole, oledOriginX, oledOriginY, 
        wallThickness+extra_lid_thickness, oledHolesX, oledHolesY, fn=fnDflt);
}

// A round hole in the front panel where it is placed by x,y and has diameter in mm
module holeInLid(x, y, diameter) {
    translate([x, y, 0])
        cylinder(r=diameter / 2, h=lidThickness + 1, $fn=fnDflt);
}

// Form the main box without a lid.
// Remove the call to standoff() if no PC board standoffs are required
module main_box(){
    // 
    difference(){
        difference() {
            difference(){
                rounded_box(outside_width, outside_length, 
                    inside_height + wallThickness + 2, edgeRadius);
                translate([0,0,inside_height + wallThickness])
                  cube([outside_width, outside_length, inside_height + wallThickness * 2]);
            }
            
            // Subtract away inside open space for the box
            translate([wallThickness, wallThickness, wallThickness])
              cube([inside_width, inside_length, inside_height + wallThickness]);
        }
        
        if (do_usb_hole > 0) {
            // Make a hole for USB power jack
            translate([0, usbHoleY, usbHoleZ])
              microUsbHole(usbSizeY, usbSizeZ);
        }
    }
    
    if (do_pcb_mounts > 0) {
        // height, diameter, holedia, X1, Y1, Z1, pcbWidth, pcbLength, fn=25
        standoff(3.5, standoffDia, pcbScrewHole, pcbOriginX, pcbOriginY, 2, 
            pcbWidth, pcbLength, fn=fnDflt);
    }
}

// Form a lid with a lip to fit within the main body
module lid(){
	difference(){
	    rounded_box(outside_width, outside_length, wallThickness * 4, edgeRadius);
	    translate([0,0, lidThickness])
	        cube([outside_width, outside_length, inside_height + wallThickness * 4]);
	}

	//Lip to fit within main body is added here. lid_fit_tol defines how tight lid fits
	lip_width = inside_width - lid_fit_tol;
	lip_length = inside_length - lid_fit_tol;
	translate([(outside_width - lip_width)/2,(outside_length - lip_length)/2, wallThickness + 0.5])
	    difference(){
	        cube([lip_width, lip_length, lid_lip_depth]);  // solid cube over full lip area
	        translate([wallThickness, wallThickness, 0])
                // Subtract away main inside area so we have only thin lip
	            cube([lip_width-wallThickness*2, lip_length-wallThickness*2, lid_lip_depth+1]);
	    }
}

// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// Render the full box body then the lid
//
main_box();

// Render the lid off to -x area and positioned relative to OLED Origin standoff
translate([-outside_width-10,0,0]) {
    difference() {
        
        // Render the lid which will be solid with a lip then be modified with holes
        lid();
        
        if (do_display > 0) {
            // Hole for the OLED display itself.  
            oledWindowHole(oledOriginX, oledOriginY, oledWinWidth, oledWinHeight, 6);
        }
        
        if (do_lid_holes > 0) {
            // Define holes X,Y, diameter in mm for switches and pots and jacks here 
            holeInLid(center_X + 10, 13, 6.2);  // pushbutton or switch 
            holeInLid(center_X + 30, 13, 6.2);  // pushbutton or switch 
            holeInLid(22, 50, 6.2);  // pushbutton or switch
            holeInLid(22, 34, 8.3);  // Potentiometer
            holeInLid(14, 13, 8.3);  // Potentiometer
            holeInLid(32, 13, 8.3);  // Potentiometer
        }
    }
    
    if (do_display > 0) {
        // OLED PC standoffs at this origin
        oledStandoffs(oledOriginX, oledOriginY);
    }
}