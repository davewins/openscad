
module screwHole(r1,h1,r2,h2){
       // r1 rad bottom of cone and the bolt hole
       // r2 rad top of cone
       // h1 full height of screw + cone
       // h2 height of cone
    
       // shaft first
      cylinder(r=r1,h=h1);
       // cone second
      translate([0,0,h1-h2]) cylinder(r1=r1, r2=r2, h=h2);
}

module base()
{
union() {
    difference() {
        cube([100,100,3]);
        translate([95,5,-6]) screwHole (2,10,4,2);
        translate([5,5,-6]) screwHole (2,10,4,2);
        translate([95,95,-6]) screwHole (2,10,4,2);
        translate([5,95,-6]) screwHole (2,10,4,2);
    }
    translate([50,35,3]) cube([50,30,15]);
}
}


difference() {
    base();
   translate([54,37,-4])
   cube([47,26,20]);
}
