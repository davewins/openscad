$fn=100;

module main_body() {
union(){

difference() {
    hull(){
    linear_extrude(6){
        circle(d=14);
        translate([12,0,0]) {
        circle(d=8.7);
        }
       }
    }
    
    translate([0,0,-2]) {
        linear_extrude(10) {
            circle(d=6.7);
        }
    }
    
  
}
        color([0,0,1]) {translate([12,0,0]) {
        linear_extrude(6.8) {
            circle(d=8.7);
        }
                linear_extrude(8.7) {
            circle(d=6.);
        }
        }
    }
}
}



difference() {
    main_body();
        rotate([90,0,0]) {
            translate([0,6.5/2,-10]) {
            linear_extrude(20) {
                circle(d=3);
            }
        }
        }
        translate([12,0,-2]) {
        linear_extrude(12) {
            circle(d=2.5);
        }
    }
}