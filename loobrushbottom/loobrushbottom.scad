$fn=100;

difference() {
linear_extrude(height = 7, center = true) circle(d=99);
translate([0,0,2]) linear_extrude(height = 7, center = true) circle(d=95);
}
