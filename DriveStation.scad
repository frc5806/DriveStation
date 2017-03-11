$fn=100;

showFrames = false;

module button() {
    circle(r=1.125/2);
}

module rocker() {
    circle(r=0.25);
    if (showFrames) square([0.5,1],center=true);
}

module miniButton() {
    circle(r=0.125);
}

module slider() {
    boltRad = 0.0629921;
    boltSpace = 3.14961;
    
    translate([0,boltSpace/2]) circle(r=boltRad);
    translate([0,-boltSpace/2]) circle(r=boltRad);
    
    square([0.0551181,2.67717],center=true);
    
    //square([0.25,3.46457],center=true);
}

module lifter() {
    rotate(90) slider();
    translate([-1,1.25]) button();
    translate([1,1.25]) button();
}

module gearMech() {
    rowSpacing = 1.5;
    for (i=[-3:2:3]) translate([i,0]) button();
        
    for (i=[-1:2:1]) {
        translate([i*3,-rowSpacing]) button();
        translate([i*1.5,-rowSpacing]) button();
    }
}

module robot() {
    rotate(90) lifter();
    translate([-5/8,0]) miniButton();
}

module shooter() {
    rSpacing = 2;
    cSpacing = 2;
    
    for (r=[-rSpacing/2:rSpacing:rSpacing/2]) for (c=[-cSpacing/2:cSpacing:cSpacing/2]) translate([r,c]) button();
    
    translate([2.25,0]) slider();
    translate([0,-2.25]) rotate(90) slider();
    
    translate([0,0]) rocker();
}

module lcd() {
    square([4.72441,3.07087],center=true);
}

module layout() {
    translate([2.25,1]) lifter();
    translate([4.25,7.75]) gearMech();
    translate([12.25,2.75]) robot();
    translate([6.75,3.25]) shooter();
    translate([11,6.75]) lcd();
}



module frame() {
    dimX = 14;
    dimY = 9;
    
    filletRad = 0.375;
    
    boltRad = 0.196/2;
    
    skirt = 3/8;
    
    difference() {
        hull() {
            translate([filletRad,filletRad]) circle(r=filletRad);
            translate([dimX-filletRad,filletRad]) circle(r=filletRad);
            translate([dimX-filletRad,dimY-filletRad]) circle(r=filletRad);
            translate([filletRad,dimY-filletRad]) circle(r=filletRad);
        }
        
        
        for (i=[skirt:(dimX-2*skirt)/2:dimX-skirt]) for (j=[skirt:dimY-2*skirt:dimY-skirt]) translate([i,j]) circle(r=boltRad);
                
        
    }

}

module 2d() {
    difference() {
        frame();
        layout();
    }
}

module knob() {
    difference() {
        hull() {
            cube([1,0.5,0.25]);
            
            filletRad = 0.125/2;

            translate([filletRad,0,0.5-filletRad]) rotate([-90,0,0]) cylinder(r=filletRad,h=0.5);
            translate([1-filletRad,0,0.5-filletRad]) rotate([-90,0,0]) cylinder(r=filletRad,h=0.5);
        }
        
        translate([0.5,-1,1.41]) rotate([-90,0,0]) cylinder(r=1,h=2);
        
        for (i=[-30:2.5:30]) {
            translate([0.5,-0.25,1.41]) rotate([0,i,0]) translate([0,0,-0.99]) rotate([-90,0,0]) cylinder(r=1/64,h=1);   
        }

        translate([0.5,0.25,0]) {
            height = 0.4;

            translate([-0.15748,-0.023622,0]) cube([0.137795,0.0472441,height]);
            translate([0.019685,-0.023622,0]) cube([0.137795,0.0472441,height]);
        }

    }
}

2d();