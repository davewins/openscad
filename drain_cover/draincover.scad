$fn=100;

module cap() {
difference() {
linear_extrude(height = 7, center = true) circle(d=47);
translate([0,0,2]) linear_extrude(height = 7, center = true) circle(d=43);
}
translate([0,0,0]) linear_extrude(height = 7, center = true) circle(d=18);

}

//linear_extrude(height = 20, center = true) circle(d=13.75);
//}



difference() {
    cap();
linear_extrude(height = 20, center = true) circle(d=16);
}

