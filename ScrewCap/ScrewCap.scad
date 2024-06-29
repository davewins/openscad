CapDiameter=9;
CapInsideDiameter=7;
ClipOutsideDiameter=8;
CapThickness=1.5;
PostHeight=5;
ClipHeight=1;


$fn=100;

difference() {
        union(){
        cylinder(h=CapThickness,d=CapDiameter);
        cylinder(h=PostHeight,d1=ClipOutsideDiameter,d2=ClipOutsideDiameter);
        translate([0,0,PostHeight]) cylinder(h=ClipHeight,d1=ClipOutsideDiameter+1,d2=CapInsideDiameter);
      }
    //translate([-CapDiameter/2,-1.25,CapThickness]) cube([CapDiameter,2.5,PostHeight+1]);
    //rotate([0,0,90]) translate([-CapDiameter/2,-1.25,CapThickness]) cube([CapDiameter,2.5,PostHeight+1]);
    translate([0,0,CapThickness])cylinder(h=CapThickness+PostHeight+1,d=5);
}


