include <ParametricDrawerSettings.scad>

//Making box:
/*difference(){
    cube([boxwidth,boxheight,boxdepth], true);
    translate([0,holeheight+thickness,bottomthickness]){
            cube([(boxwidth-(thickness*2)),holeheight,(boxdepth-bottomthickness)],true);
    }
    translate([0,0,bottomthickness]){
            cube([(boxwidth-(thickness*2)),holeheight,(boxdepth-bottomthickness)],true);
    }
    //translate([0,-(holeheight+thickness),bottomthickness]){
    //        cube([(boxwidth-(thickness*2)),holeheight,(boxdepth-bottomthickness)],true);
    //}
}*/

//Making drawers:
//Simple drawer:
difference(){
    union(){

        //main box of drawer
        translate([0,drawerpositionY,0]){
            cube([drawerwidth,drawerdepth,drawerheight],true);
        }
        //Handle
        translate([0,drawerpositionY-drawerdepth/2-handledepth/2,-drawerheight/2+bottomthickness/2]){
            translate([0,0,(drawerheight/2)])
                cube([handlewidth,handledepth,bottomthickness],true);
            
        }
    }
    //Hole in cube
    translate([0,drawerpositionY,bottomthickness]){
        cube([drawerwidth-thickness*2,drawerdepth-thickness*2,drawerheight],true);
    }
}
