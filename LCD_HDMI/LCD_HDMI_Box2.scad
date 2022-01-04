
lcd_width=210.5;                    //Overall LCD Panel Width
lcd_height=126;                     //Overall LCD Panel Height
lcd_depth=3;                        //Overall height of the LCD Panel
lcd_viewport_width=201;             //Width of viewable screen
lcd_viewport_height=114;            //Height of viewable screen
lcd_surround_width=20;              //Total Width of Surround 
lcd_left_margin=3.5;                //Width of the margin on the left of the LCD Panel
lcd_right_margin=6;                 //Width of the margin on the right side of the LCD Panel
lcd_top_margin=3;                   //Width of top margin of the LCD Panel
lcd_bottom_margin=8.5;              //Width of bottom margin of the LCD Panel
wall_thickness=2;

outside_width=lcd_width + lcd_surround_width;
outside_height=lcd_height + lcd_surround_width;
inside_width=outside_width - wall_thickness;
inside_height=outside_height - wall_thickness;

module lid()
{
    //Main surface
    difference() {
        cube([outside_width, outside_height, wall_thickness], true);
        cube([lcd_viewport_width, lcd_viewport_height, 5], true);
    }
    
    //Box Lip
    difference() {
        translate([0,0,wall_thickness])
        cube([outside_width-2, outside_height-2, 3], true);
        translate([0,0,0])
        cube([outside_width-(wall_thickness*2), outside_height-(wall_thickness*2), 10], true);
    }
    
    //LCD Lip
    difference() {
        translate([1,-2,lcd_depth]) 
            color([1,0,0]) cube([lcd_width+(wall_thickness*4), lcd_height+(wall_thickness*4), 3],true);
        translate([1,-2,lcd_depth])
            cube([lcd_width+1, lcd_height+1, 20], true);
    }
    
}

module lcd_model()
{
    color([0,0,1]) cube([lcd_width, lcd_height, lcd_depth]);
    translate([lcd_left_margin,lcd_top_margin,lcd_depth]) color([0,1,0]) cube([lcd_viewport_width, lcd_viewport_height, .5]);
}


lid();
//show the LCD Model slightly hovering to try and get the lip right
//translate([(-lcd_width/2)+1,(lcd_height/2)-lcd_top_margin,lcd_depth+(wall_thickness/2)+7]) rotate([180,0,0]) lcd_model();
