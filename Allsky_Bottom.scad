$fn=100;

maxHeight=63;
wallThickness=4;
baseHeight=wallThickness;
diameter=97;
n=24;
r_hole1=1;
r_hole2=2;
r_hole3=3;
distance=20;
    
    //translate([0, 0, baseHeight]) 
        difference() {
            cylinder(h=maxHeight, d=diameter + wallThickness);
            translate ([0,0,wallThickness-2]) color([1,0,0]) cylinder(h=maxHeight, d=diameter);
            translate([0,0,-wallThickness+1]) color([0,1,0]) cylinder(h=wallThickness+5,d=5);
              for(i=[1:n])
              {
    translate([distance*cos(i*(360/n)),distance*sin(i*(360/n)),0]) cylinder(maxHeight+1,r_hole1, r_hole1, center=true);   
    translate([(distance+10)*cos((i+1/3)*(360/(n))),(distance+10)*sin((i+1/3)*(360/(n))),0]) cylinder(maxHeight+1,r_hole2,r_hole2,center=true);
    translate([(distance+20)*cos((i+2/3)*(360/(n))),(distance+20)*sin((i+2/3)*(360/(n))),0]) cylinder(maxHeight+1,r_hole3,r_hole3,center=true); 

  }
        }