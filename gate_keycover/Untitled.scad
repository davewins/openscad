$fn=100;
rim=2.5;
thickness=1;
internaldiameter=30;
internalkeybody=7;
externalkeybody=7+(rim*2);
keybodylength=17;
lip=2.5;
lipthickness=1;



module keyhandle() {
difference(){
    cylinder(h=thickness, d=internaldiameter+(rim*2), center=true);
    cylinder(h=thickness*2, d=internaldiameter, center=true);
}
}


module keybody(){
difference() {
translate([(internaldiameter/2),-externalkeybody/2,-thickness/2]){
    color ([0,0,1]) cube([keybodylength+(rim),internalkeybody+(rim*2),thickness]);
}



}

}

difference(){
union(){
    keyhandle();
    keybody();
}
translate([(internaldiameter/2-rim),-internalkeybody/2,-thickness]){
    color ([1,0,0]) cube([keybodylength+rim,internalkeybody,thickness*2]);
}
}
