$fn=100;

tolerance=0.4;
insideDiameter=90 + tolerance;
endStopLength=10;
thickness=3;
endStopDiameter=insideDiameter - 10;

union() {
    difference() {
        cylinder(h=endStopLength, d=insideDiameter+thickness);
        translate ([0,0,+1]) cylinder(h=endStopLength+thickness, d=insideDiameter);
        cylinder(h=thickness, d=endStopDiameter);
    }
    
}