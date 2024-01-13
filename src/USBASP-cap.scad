include <Dimensions.scad>

delta=0.3;
CapInnerLength=BoxInnerLength+Wall*2+delta*2;
CapInnerWidth=BoxInnerWidth+Wall*2+delta*2;
CapInnerHeight=BoxInnerHeight+Wall*2;

CapHoleX=18;
CapHoleY=21;

rotate([180,0,0])
createUsbAspCapModel();

module createUsbAspCapModel(){
    difference()
    {
        cube([CapInnerLength+Wall*2,CapInnerWidth+Wall*2,CapInnerHeight+Wall*2],center=true);

        union()
        {
            translate([0,0,-Wall/2])
            cube([CapInnerLength,CapInnerWidth,CapInnerHeight+1],center=true);

            translate([CapHoleX/2-CapInnerLength/2+1,0,0])
            difference()
            {
                cube([CapHoleX,CapHoleY,20],center=true);

                translate([CapHoleX/4+0.5,-5/2,0])
                cube([CapHoleX/2+overlap,CapHoleY-5+overlap,20+overlap],center=true);
            }

            translate([-7,-4.5,0])
            cube([6,4,20],center=true);

            translate([BoxInnerLength/3,BoxInnerWidth/2,clipZ/2+BoxInnerHeight/2-2-CapInnerHeight/2])
            cube([clipX+1,clipY+50,clipZ],center=true);

            translate([-BoxInnerLength/3,BoxInnerWidth/2,clipZ/2+BoxInnerHeight/2-2-CapInnerHeight/2])
            cube([clipX+1,clipY+50,clipZ],center=true);

            usbCutZ=20;
            translate([20,0,-usbCutZ/2+BoxInnerHeight/2-1])
            cube(size=[UsbLength,UsbWidth,usbCutZ],center=true);
        }
    }

    translate([-14,-7/2+1/2-overlap,-Wall+3])
    cube([Wall,CapInnerWidth-7-1,CapInnerHeight-3+overlap],center=true);

    translate([-13,0,-Wall+3])
    cube([2,1,CapInnerHeight-3+overlap],center=true);
}
