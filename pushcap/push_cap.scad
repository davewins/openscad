//Size of the hole to be covered.
hole_diameter=17.5;

// Size of the flange that covers the outside of the hole
flange_diameter=30;

// Thickness of the flange
flange_thickness=2;

// Number of catches
catch_count=5;

// This will be the thickness of the material the hole is in
catch_height=4.7;

// Theickness of the catches
catch_thickness=3;

// Size of the catch lip on the inside of the hole
catch_lip=1;

// How much inside the hole you want the catches to be places
catch_offset=.5;

/* [Hidden] */
$fn=50;
catch_rotation=360/(catch_count*2);



flange(flange_diameter,flange_thickness);
for ( i = [0 : catch_count-1] )
{
    rotate([0,0,i*catch_rotation*2])
    catch(hole_diameter,catch_height,catch_thickness,catch_lip,catch_offset,catch_rotation,flange_thickness);
}





module catch(hd,ch,ct,cl,co,cr,ft)
{
    catch_diameter=hd-co;

    difference() 
    {
        union()
        {
            translate([0,0,ft])
                cylinder(d = catch_diameter, h = ch+cl*2);
            translate([0,0,ch+ft+cl])
                ring(catch_diameter/2,cl);
        }
        translate([0,0,ft])
            cylinder(d = catch_diameter-ct
        , h = ch+cl*2);
        translate([-catch_diameter/2-cl,0,ft])     
          cube([catch_diameter+catch_lip*2, catch_diameter/2+cl, ch+cl*2]);  
        
        rotate([0,0,cr])
            translate([-catch_diameter/2-cl,-1*(catch_diameter/2+cl),ft])     
              cube([catch_diameter+cl*2, catch_diameter/2+cl, ch+cl*2]);  
    }   
}


module flange(fd,ft)
{
   cylinder(d = fd, h = ft); 
}

module ring(r1,r2)
    rotate_extrude( )
       translate([r1,0,0])
           circle(d=2*r2,$fn=50);