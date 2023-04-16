capOutsideDiameter=29.85;
capThickness=1.5;
capInsideDiameter=19.6;
capStemLength=2;
capStemThickness=1.5;

$fn=100;

difference() {
    union() {
    cylinder(h=capThickness,d=capOutsideDiameter);
    cylinder(h=capThickness+capStemLength,d=capInsideDiameter);
    }
    translate([0,0,capThickness]) cylinder(h=capStemLength+1,d=capInsideDiameter-capStemThickness);
}
