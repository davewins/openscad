$fn=100;
rim=7.5;
thickness=2;
internaldiameter=35;
lip=20;
lipthickness=2;

module keyhandle() {

    cylinder(h=thickness, d=internaldiameter+(rim*2), center=true);
}

module tag() {
    difference(){
        hull() {
        translate([internaldiameter/2+rim,0,-thickness/2]) cylinder(h=thickness, d=7.5);
        translate([internaldiameter/2+(rim*2),0,-thickness/2]) cylinder(h=thickness, d=7.5);
        }
        translate([internaldiameter/2+(rim*2),0,-thickness]) cylinder(h=thickness*2, d=4);
    }
}

union() {
    keyhandle();
    tag();
}