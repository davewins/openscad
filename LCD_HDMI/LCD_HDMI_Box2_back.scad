
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
lcd_cable_width=40;

outside_width=lcd_width + lcd_surround_width;
outside_height=lcd_height + lcd_surround_width;


module back()
{
    //Main surface

    cube([outside_width, outside_height, 1.5], true);
    
    //Box Lip
    difference() {
        translate([0,0,wall_thickness+1.5])
        cube([outside_width, outside_height, 8], true);
        translate([0,0,0])
        cube([outside_width-(wall_thickness), outside_height-(wall_thickness), 20], true);
    }
    
}

module mounting_holes() {
    //bottom right
    translate([(outside_width/2)-63,(outside_height/2)-43,-5])
        cylinder(10,d=3, $fn=100);
    //bottom left
    translate([(outside_width/2)-146,(outside_height/2)-43,-5])
        cylinder(10,d=3, $fn=100);
    //top right
    translate([((outside_width/2)-66),((outside_height/2)-43)-50,-5])
        cylinder(10,d=3, $fn=100);
    //top left
    translate([(outside_width/2)-138,((outside_height/2)-43)-50,-5])
        cylinder(10,d=3, $fn=100);            
}

    //Slot for LCD cable
    difference() {
        back();
        translate([0,(outside_height/2)-35,0])
            cube([50,2.5,40], true);
        mounting_holes();
    }

