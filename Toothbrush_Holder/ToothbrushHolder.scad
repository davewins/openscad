difference () {
    chamferCylinder(height = 90, radius = 22.5);
    translate([0,0,2])
        cylinder(90,r=20.5, $fn = circleSegments(20.5, 1));
}


function circleSegments(r, q = -1.0) = (r * PI * 4 + 40) * ((q >= 0.0) ? q : globalCircleQuality);

// set global quality to 1.0, can be overridden by user
globalCircleQuality = 1.0;

// taken from https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD/blob/master/Chamfer.scad
/**
  * chamferCylinder returns an cylinder or cone with 45° chamfers on
  * the edges of the cylinder. The chamfers are diectly printable on
  * Fused deposition modelling (FDM) printers without support structures.
  *
  * @param  h    Height of the cylinder
  * @param  r    Radius of the cylinder (At the bottom)
  * @param  r2   Radius of the cylinder (At the top)
  * @param  ch   The "height" of the chamfer at radius 1 as
  *                seen from one of the dimensional planes (The 
  *                real length is side c in a right angled triangle)
  * @param  ch2  The "height" of the chamfer at radius 2 as
  *                seen from one of the dimensional planes (The 
  *                real length is side c in a right angled triangle)
  * @param  a    The angle of the visible part of a wedge
  *                starting from the x axis counter-clockwise
  * @param  q    A circle quality factor where 1.0 is a fairly
  *                good quality, range from 0.0 to 2.0
  */

module chamferCylinder(h, r, r2 = undef, ch = 1, ch2 = undef, a = 0, q = -1.0, height = undef, radius = undef, radius2 = undef, chamferHeight = undef, chamferHeight2 = undef, angle = undef, quality = undef) {
    // keep backwards compatibility
    h   = (height == undef) ? h : height;
    r   = (radius == undef) ? r : radius;
    r2  = (radius2 == undef) ? r2 : radius2;
    ch  = (chamferHeight == undef) ? ch : chamferHeight;
    ch2 = (chamferHeight2 == undef) ? ch2 : chamferHeight2;
    a   = (angle == undef) ? a : angle;
    q   = (quality == undef) ? q : quality;
    
    height         = h;
    radius         = r;
    radius2        = (r2 == undef) ? r : r2;
    chamferHeight  = ch;
    chamferHeight2 = (ch2 == undef) ? ch : ch2;
    angle          = a;
    quality        = q;
    
    module cc() {
        upperOverLength = (chamferHeight2 >= 0) ? 0 : 0.01;
        lowerOverLength = (chamferHeight >= 0) ? 0 : 0.01;

        if(chamferHeight >= 0 || chamferHeight2 >= 0) {
            hull() {
                if(chamferHeight2 > 0) {
                    translate([0, 0, height - abs(chamferHeight2)]) cylinder(abs(chamferHeight2), r1 = radius2, r2 = radius2 - chamferHeight2, $fn = circleSegments(radius2, quality));
                }
                translate([0, 0, abs(chamferHeight)]) cylinder(height - abs(chamferHeight2) - abs(chamferHeight), r1 = radius, r2 = radius2, $fn = circleSegments(max(radius, radius2), quality));
                if(chamferHeight > 0) {
                    cylinder(abs(chamferHeight), r1 = radius - chamferHeight, r2 = radius, $fn = circleSegments(radius, quality));
                }
            }
        }

        if(chamferHeight < 0 || chamferHeight2 < 0) {
            if(chamferHeight2 < 0) {
                translate([0, 0, height - abs(chamferHeight2)]) cylinder(abs(chamferHeight2), r1 = radius2, r2 = radius2 - chamferHeight2, $fn = circleSegments(radius2, quality));
            }
            translate([0, 0, abs(chamferHeight) - lowerOverLength]) cylinder(height - abs(chamferHeight2) - abs(chamferHeight) + lowerOverLength + upperOverLength, r1 = radius, r2 = radius2, $fn = circleSegments(max(radius, radius2), quality));
            if(chamferHeight < 0) {
                cylinder(abs(chamferHeight), r1 = radius - chamferHeight, r2 = radius, $fn = circleSegments(radius, quality));
            }
        }
    }
    module box(brim = abs(min(chamferHeight2, 0)) + 1) {
        translate([-radius - brim, 0, -brim]) cube([radius * 2 + brim * 2, radius + brim, height + brim * 2]);
    }
    module hcc() {
        intersection() {
            cc();
            box();
        }
    }
    if(angle <= 0 || angle >= 360) cc();
    else {
        if(angle > 180) hcc();
        difference() {
            if(angle <= 180) hcc();
            else rotate([0, 0, 180]) hcc();
            rotate([0, 0, angle]) box(abs(min(chamferHeight2, 0)) + radius);
        }
    }
}

