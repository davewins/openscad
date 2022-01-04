use <threads-library-by-cuiso-v1.scad>


clip_inside_mm=20;
clip_thickness_mm=5;
clip_height_mm=17;
cutout_mm=5;
$fn=6;

difference() {
    //outside dimensions of the clip
    cube([clip_inside_mm + clip_thickness_mm*2+5,
    clip_inside_mm + clip_thickness_mm*2+5,clip_height_mm], center=true);
    
    //remove the inside of the clip
    cube([clip_inside_mm+0.25,clip_inside_mm+.5,clip_height_mm+5], center=true);
    
    //cut out the end
    translate([clip_inside_mm/2,0,0])
    cube([clip_thickness_mm+12,clip_inside_mm,clip_height_mm+1], center=true);  
  
    //Slot
    translate([clip_inside_mm/2+2.5,0,2])
    cube([cutout_mm,28,clip_height_mm], center=true); 
    
    
    //little chamfer
    translate([clip_inside_mm/2+5.5,0,2])
    cube([cutout_mm,22,clip_height_mm], center=true);
    
    //Thread for 6mm bolt
    difference(){
    translate([-20,0,0])
    rotate([90,0,90]) 
    thread_for_nut(diameter=6, length=clip_thickness_mm*2); 
    }
   
}

// simple SCREW with hexagonal head:
translate([0,0,-clip_height_mm/2]) {
thread_for_screw(diameter=6.30, length=clip_thickness_mm*3); 
cylinder(d=15, h=4, $fn=6);}

    //this is the inside bit - remove after - used for showing where the tube will go

    //color([1,0,0])
    //cube([clip_inside_mm,clip_inside_mm,clip_height_mm+5], center=true);






