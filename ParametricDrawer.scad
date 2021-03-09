include <ParametricDrawerSettings.scad>

difference(){
    union(){

        //main box of drawer
        translate([0,drawerpositionY,0]){
            cube([drawerwidth,drawerdepth,drawerheight],true);
        }
        //Handle
        translate([0,drawerpositionY-drawerdepth/2-handledepth/2,-drawerheight/2+bottomthickness/2]){
            translate([0,2,(drawerheight/2)])                       //find the middle of the drawer
                cube([handlewidth/2,handledepth,bottomthickness*2],true);
            translate([0,2-handledepth,(drawerheight/2)]) 
                cube([handlewidth,handledepth,handledepth],true);
            
        }
    }
    //Hole in cube
    translate([0,drawerpositionY,bottomthickness]){
        cube([drawerwidth-thickness*2,drawerdepth-thickness*2,drawerheight],true);
    }

}