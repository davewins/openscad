use <../libraries/Chamfer.scad>        

lcd_width=210.5;                    //Overall LCD Panel Width
lcd_height=126;                     //Overall LCD Panel Height
lcd_depth=3;                        //Overall height of the LCD Panel
lcd_viewport_width=201;             //Width of viewable screen
lcd_viewport_height=114;            //Height of viewable screen
lcd_surround_width=15;              //Total Width of Surround 
lcd_left_margin=3.5;                //Width of the margin on the left of the LCD Panel
lcd_right_margin=6;                 //Width of the margin on the right side of the LCD Panel
lcd_top_margin=3;                   //Width of top margin of the LCD Panel
lcd_bottom_margin=8.5;              //Width of bottom margin of the LCD Panel
wall_thickness=1.5;
edgeRadius    = 1.5;
lcd_rim_thickness=1.5;
lcd_rim_height=3;

outside_width=lcd_width + lcd_surround_width;
outside_height=lcd_height + lcd_surround_width;
inside_width=outside_width - wall_thickness;
inside_height=outside_height - wall_thickness;
lid_fit_tol=0.2;
lid_lip_depth=2;


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

module lid()
{

    difference(){   
        rounded_box(outside_width, outside_height, wall_thickness *4, edgeRadius);
        //take out the top part of the cube to make it flat
        translate([0,0, wall_thickness+1.5])
            cube([outside_width, outside_height,wall_thickness*4]);
    }

    //Lip to fit within main body is added here. lid_fit_tol defines how tight lid fits
	lip_width = inside_width - lid_fit_tol;
	lip_length = inside_height - lid_fit_tol;
	translate([(outside_width - lip_width)/2,(outside_height - lip_length)/2, wall_thickness + 0.5])
	difference(){
        color([1,0,0])  cube([lip_width, lip_length, lid_lip_depth]);  // solid cube over full lip area
        translate([wall_thickness, wall_thickness, 0])
        // Subtract away main inside area so we have only thin lip
            cube([lip_width-wall_thickness*2, lip_length-wall_thickness*2, lid_lip_depth+1]);
	}
    
	//Lip that will go around the LCD module to keep it centred
    lcd_lip_width = lcd_width - lid_fit_tol;
	lcd_lip_length = lcd_height - lid_fit_tol;
    translate([(outside_width-lcd_width)/2,(outside_height-lcd_height)/2,lcd_depth])
	difference(){
        color([1,1,0])  cube([lcd_lip_width+wall_thickness, lcd_lip_length+wall_thickness, lid_lip_depth]);  // solid cube over full lip area
        translate([wall_thickness, wall_thickness, -1])
        // Subtract away main inside area so we have only thin lip
            cube([lcd_lip_width-wall_thickness*2, lcd_lip_length-wall_thickness*2, lid_lip_depth+4]);
	}
    
    //Standoffs bottom left
    difference(){
        translate([(outside_width-lcd_width)/2,(outside_height-lcd_height)/2, 2])
            cylinder(h=lcd_depth, d=5, $fn = 100);
        translate([(outside_width-lcd_width)/2,(outside_height-lcd_height)/2, 2])
            cylinder(h=10, d=2, $fn = 100);
    }
    //Standoff top left
    difference(){
        translate([(outside_width-lcd_width)/2,(lcd_height+lcd_bottom_margin), 2])
            cylinder(h=lcd_depth, d=5, $fn = 100);
        translate([(outside_width-lcd_width)/2,(lcd_height+lcd_bottom_margin), 2])
            cylinder(h=10, d=2, $fn = 100);
    }
    //Standoff top right
    difference(){
        translate([(lcd_width+lcd_right_margin+3),(outside_height-lcd_bottom_margin+2), 2])
            cylinder(h=lcd_depth, d=5, $fn = 100);
        translate([lcd_width+lcd_right_margin+3,(outside_height-lcd_bottom_margin+2), 2])
            cylinder(h=10, d=2, $fn = 100);
    }
    //Standoff bottom right
    difference(){
        translate([(lcd_width+lcd_right_margin+3),lcd_bottom_margin, 2])
            cylinder(h=lcd_depth, d=5, $fn = 100);
        translate([lcd_width+lcd_right_margin+3,(lcd_bottom_margin), 2])
            cylinder(h=10, d=2, $fn = 100);
    }
}

module lcd_model()
{
    color([0,0,1]) cube([lcd_width, lcd_height, lcd_depth]);
    translate([lcd_left_margin,lcd_top_margin,lcd_depth]) color([1,1,1]) cube([lcd_viewport_width, lcd_viewport_height, .5]);
}

difference(){
    lid();
    //Window for LCD Viewport
    translate([(outside_width-lcd_width)/2+lcd_left_margin,(outside_height-lcd_height)/2+lcd_bottom_margin,0]) 
    color ([1,0,1]) cube([lcd_viewport_width,lcd_viewport_height,wall_thickness*4]);
}


//show the LCD Model
//translate([(outside_width-lcd_width)/2,(outside_height+lcd_height)/2,lcd_depth+(wall_thickness)]) rotate([180,0,0]) lcd_model();
