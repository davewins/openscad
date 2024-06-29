innerRadius=74/2;
lipHeight=2;
outerRadius=78/2;
holeRadius=53/2;
dropHeight=13;

$fn=100;

module mainBody(){
cylinder(lipHeight,outerRadius,outerRadius);
cylinder(dropHeight,innerRadius,innerRadius);
}

module tube() {
difference() {
    mainBody();
    cylinder(dropHeight,holeRadius,holeRadius);
}
}

difference() {
    tube();
    cylinder(dropHeight-2,innerRadius-2,innerRadius-2);
}

