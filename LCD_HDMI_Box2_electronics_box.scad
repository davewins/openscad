//LCD_HDMI_BOX2_electronics_box

$fn=100;
wall_thickness=2;
inside_width=90;
inside_length=65;
inside_height=10;
box_height=10+wall_thickness;
box_width=90+wall_thickness;
box_length=65+wall_thickness;
top_left_x=wall_thickness+11;
top_left_y=wall_thickness+2.5;
top_right_x=top_left_x+72;

module box() {
    difference() {
        cube([box_width,box_length,box_height]);
        translate([1,1,1])
          cube([inside_width,inside_length,inside_height+5]);
    }
}

module mountingHoles() {
    //top left
    translate([top_left_x,top_left_y,-1]) cylinder(5,d=3);
    //top right
    translate([top_left_x+72,top_left_y,-1]) cylinder(5,d=3);
    //bottom left
     translate([wall_thickness+3,top_left_y+48,-1]) cylinder(5,d=3);
    //bottom right
    translate([wall_thickness+87,top_left_y+48,-1]) cylinder(5,d=3);
}

module ports() {
    translate([top_left_x+2,-3,4])
    cube([67,10,15]);
}

module switchhole () {
    translate([box_width-5,box_length/2-15,9])
    cube([15,15,5]);
}


difference() {
    box();
    mountingHoles();
    ports();
    switchhole();
}

