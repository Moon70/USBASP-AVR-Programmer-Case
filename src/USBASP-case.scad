include <Dimensions.scad>

createUsbAspCaseModel();

module createUsbAspCaseModel(){
    addClips(){
        difference()
        {
            createBox();

            translate([-BoxInnerLength/2,0,UsbHeight/2+3.5])
            cube(size=[UsbLength,UsbWidth,UsbHeight],center=true);
        }
    }
}

module createBox(){
    translate([0,0,BoxInnerHeight/2])
    difference()
    {
        cube(size=[BoxInnerLength+Wall*2,BoxInnerWidth+Wall*2,BoxInnerHeight+Wall*2],center=true);

        color("red")
        translate([0,0,10/2])
        cube(size=[BoxInnerLength,BoxInnerWidth,BoxInnerHeight+10],center=true);
    }

    brace1X=5;
    braceY=2.5;
    braceZ=2;
    translate([brace1X/2-BoxInnerLength/2,-braceY/2+BoxInnerWidth/2,braceZ/2])
    cube([brace1X,braceY,braceZ],center=true);

    brace2X=20;
    translate([brace2X/2-BoxInnerLength/2,braceY/2-BoxInnerWidth/2,braceZ/2])
    cube([brace2X,braceY,braceZ],center=true);
    translate([-brace2X/2+BoxInnerLength/2,-braceY/2+BoxInnerWidth/2,braceZ/2])
    cube([brace2X,braceY,braceZ],center=true);

    brace3X=8;
    translate([-brace3X/2+BoxInnerLength/2,braceY/2-BoxInnerWidth/2,braceZ/2])
    cube([brace3X,braceY,braceZ],center=true);
}

module addClips(){
    children();

    translate([BoxInnerLength/3,BoxInnerWidth/2,clipX/2+BoxInnerHeight/2+1.2])
    createClip();

    translate([-BoxInnerLength/3,BoxInnerWidth/2,clipX/2+BoxInnerHeight/2+1.2])
    createClip();

    translate([BoxInnerLength/3,-BoxInnerWidth/2,clipX/2+BoxInnerHeight/2+1.2])
    createClip(180);

    translate([-BoxInnerLength/3,-BoxInnerWidth/2,clipX/2+BoxInnerHeight/2+1.2])
    createClip(180);
}

module createClip(rotateZ=0){
    rotate([0,90,rotateZ])
    linear_extrude(height = clipZ, center = true, convexity = 10, twist = 0)
    polygon(points=[
        [0,0],
        [0,Wall],
        [clipX,Wall+clipY],
        [clipX,0],
    ]);
}
