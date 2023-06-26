$fn=100;

tolerance=0.4;
insideDiameter=10 + tolerance;
endStopLength=20;
thickness=2;
endStopDiameter=22;

union() {
    difference() {
        cylinder(h=endStopLength, d=insideDiameter+thickness);
        cylinder(h=endStopLength+thickness, d=insideDiameter);
    }
    cylinder(h=thickness, d=endStopDiameter);
}