$fn=100;
rim=7.5;
thickness=2;
internaldiameter=35;
lip=20;
lipthickness=2;

module keyhandle() {
    difference() {
        cylinder(h=thickness, d=internaldiameter+(rim*2), center=true);
        cylinder(h=thickness+4, d=internaldiameter, center=true);
    }
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

module lip() {
    difference() {
        translate([0,0,9]) color ([1,0,0]) cylinder(h=lip, d=internaldiameter+thickness, center=true);
        translate([0,0,9]) color ([0,1,0]) cylinder(h=lip*2, d=internaldiameter, center=true);
    }
}

union() {
    keyhandle();
    tag();
    lip();
}