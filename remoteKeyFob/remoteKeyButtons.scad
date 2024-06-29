
th=2;	// wall thickness




module buttons() {
    buttonLength=8;
    buttonWidth=11.6;

    union() {
        translate([0,0,-th*2]) cube([buttonLength,buttonWidth,th*2]);
        translate([-0.8,-0.8,0]) cube([buttonLength+1.5,buttonWidth+1.5,1]);
        translate([buttonLength/2,buttonWidth/2,-(th*2)-0.5]) color ([1,0,0]) linear_extrude(1) text("A", size=5,halign="center", valign="center", font="arial");
    }
    
    union() {
        translate([-(1.8+buttonLength),0,-th*2]) cube([buttonLength,buttonWidth,th*2]);
        translate([-(1.8+buttonLength)-0.8,-0.8,0]) cube([buttonLength+1.5,buttonWidth+1.5,1]);
        translate([-(buttonWidth/2),buttonWidth/2,-(th*2)-0.5]) color ([1,0,0]) linear_extrude(1) mirror([1,0,0]) text("B", size=5,halign="center", valign="center", font="arial");
    }
    
    union() {
        translate([-(1.8+buttonLength),-(buttonWidth+1.8),-th*2]) cube([buttonLength,buttonWidth,th*2]);
        translate([-(1.8+buttonLength)-0.8,-(buttonWidth+1.8)-0.8,0]) cube([buttonLength+1.5,buttonWidth+1.5,1]);
        translate([(buttonLength/2),-buttonLength,-(th*2)-0.5]) color ([1,0,0]) linear_extrude(1) mirror([1,0,0]) text("C", size=5,halign="center", valign="center", font="arial");
    }
    
    union() {
        translate([0,-(buttonWidth+1.8),-th*2]) cube([buttonLength,buttonWidth,th*2]);
        translate([-0.8,-(buttonWidth+1.8)-0.8,0]) cube([buttonLength+1.5,buttonWidth+1.5,1]);
        translate([-(buttonWidth/2),-buttonLength,-(th*2)-0.5]) color ([1,0,0]) linear_extrude(1) mirror([1,0,0]) text("D", size=5,halign="center", valign="center", font="arial");
    }
}
    


buttons();


