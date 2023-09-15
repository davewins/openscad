DepthOfCSM=38;
WidthOfCSM=89;
Thickness=2;

union() {
cube([WidthOfCSM+Thickness,Thickness,(DepthOfCSM/2)+Thickness]);
//color("blue")
cube([WidthOfCSM+Thickness,(DepthOfCSM/2)+Thickness,Thickness]);
//color("red")
cube([Thickness,(DepthOfCSM/2)+Thickness,(DepthOfCSM/2)+Thickness]);
}

