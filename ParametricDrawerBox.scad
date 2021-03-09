include <ParametricDrawerSettings.scad>

//Making box:
difference(){
    cube([boxwidth,boxheight,boxdepth],true);
    //translate([0,holeheight+thickness,bottomthickness]){
    //        cube([(boxwidth-(thickness*2)),holeheight,(boxdepth-bottomthickness)],true);
    //}
    translate([0,0,bottomthickness]){
            //cube([(boxwidth-(thickness*2)),holeheight,(boxdepth-bottomthickness)],true);
            cube([(boxwidth-(thickness*2)),(boxheight-(thickness*2)),(boxdepth-bottomthickness)],true);
    }
}
