$fn=100;
rim=8.5;
thickness=2;
internaldiameter=33;
lip=5;
lipthickness=2;

module keyhandle() {
    cylinder(h=thickness, d=internaldiameter+(rim*2), center=true);
}

module lip() {
    difference() {
        translate([0,0,thickness]) color ([1,0,0]) cylinder(h=lip, d=internaldiameter+thickness, center=true);
        translate([0,0,thickness]) color ([0,1,0]) cylinder(h=lip*2, d=internaldiameter, center=true);
    }
}

module handle() {
    color ([0,0,1]) hull() {
        translate([-5,7.5,-thickness]) cylinder(h=thickness*2, d=lip);
        translate([-5,-7.5,-thickness]) cylinder(h=thickness*2, d=lip);
    }
    color ([0,0,1]) hull() {
        translate([5,7.5,-thickness]) cylinder(h=thickness*2, d=lip);
        translate([5,-7.5,-thickness]) cylinder(h=thickness*2, d=lip);
    }
}

difference() {
    union() {
        keyhandle();
        lip();
    }
    handle();
}