$fn=100;

module main_body() {
union(){

difference() {
    //the main shape of the connector
    hull(){
    linear_extrude(6){
        circle(d=14);
        translate([12,0,0]) {
        circle(d=8.7);
        }
       }
    }
    
    //make a whole where the motor spindle inserts
    translate([0,0,-2]) {
        linear_extrude(10) {
            circle(d=7.4);
        }
    }
  
}

//now add the slightly higher circle where the arm sits on
color([0,0,1]) {translate([12,0,0]) {
    linear_extrude(6.8) {
        circle(d=8.7);
        }
    //circle that inserts into the arm itself
    linear_extrude(8.7) {
        circle(d=6);
        }
    }
}
}
}

//make the holes
difference() {
    main_body();
        //hole through the side for the motor pin
        rotate([90,0,0]) {
            translate([0,6.5/2,-10]) {
            linear_extrude(20) {
                circle(d=3);
            }
        }
        }
        
    //hole through the arm insert for the screw to attach the arm (not threaded and worked ok)
    translate([12,0,-2]) {
        linear_extrude(12) {
            circle(d=3);
        }
    }
}