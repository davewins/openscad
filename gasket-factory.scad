//gasket-factory
//Creates a gasket defined by inner diameter, outer diameter and height

// This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
// (http://creativecommons.org/licenses/by-sa/4.0/)


d1=100; //[2:0.01:100]
d2=120; //[2:0.01:100]
height=1; //[0.5:0.01:10]
r_hole1=2;
n=4;
distance=((d2-d1)/2)+(d1/2)-5;
$fn=100;



/*
Creates a gasket

Parameters
----------
h   height
di  inner diameter
da  outer diameter
*/
module gasket(di,da,h,n=64){
    difference(){
        cylinder(r=da/2,h=h);
        translate([0,0,-1]) cylinder(r=di/2,h=h+2);
    }
}
    



di=min(d1,d2);
da=max(d1,d2);
difference() {
gasket(di=di,da=da,h=height);

        for(i=[1:n])
        { 
            color([1,0,0])     translate([distance*cos(i*(360/n)),distance*sin(i*(360/n)),.5]) cylinder(height+1,r_hole1, r_hole1, center=true);    
        } 
    }