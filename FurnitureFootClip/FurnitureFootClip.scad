//Author:Dave Winstone
//Description: When using furniture levelling feet on square metal legs, you can get the screw showing, so this clips over the screw to hide it.abs

ScrewDiameter=8;
LegWidth=20;
LegDepth=20;
LegHeight=30;

difference() {
cube([LegWidth,LegDepth,LegHeight],center=true);
cylinder(h=LegHeight+5,r1=ScrewDiameter/2,r2=ScrewDiameter/2,center=true);
translate([0,-(ScrewDiameter-1)/2,-LegHeight]) cube([LegHeight+5,ScrewDiameter-1,LegHeight*2]);  
}

