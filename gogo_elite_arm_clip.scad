
clip_inside_mm=20;
clip_thickness_mm=5;
clip_height_mm=17;
cutout_mm=4;

difference() {
    //outside dimensions of the clip
    cube([clip_inside_mm + clip_thickness_mm*2,
    clip_inside_mm + clip_thickness_mm*2,clip_height_mm], center=true);
    
    //remove the inside of the clip
    cube([clip_inside_mm,clip_inside_mm,clip_height_mm+5], center=true);
    
    //cut out the end
    translate([clip_inside_mm/2,0,0])
    cube([clip_thickness_mm+6,clip_inside_mm,clip_height_mm+1], center=true);  
  
    translate([clip_inside_mm/2+2,0,2])
    cube([cutout_mm,27,clip_height_mm], center=true); 
}


    //this is the inside bit - remove after - used for showing where the tube will go

    //color([1,0,0])
    //cube([clip_inside_mm,clip_inside_mm,clip_height_mm+5], center=true);






