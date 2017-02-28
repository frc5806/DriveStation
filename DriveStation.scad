module board() {
    cube([60, 14, 2]);
}
module slider(location) {
    translate([location[0], location[1], 2]) {
        color("DimGray")
        cube([0.35, 3.5, 0.4]);
    }
    translate([location[0] + 0.35/2, location[1] + 3.5/2, 2.4]) {
        color("Silver")
        cube([0.075, 0.5, 0.075]);
    }
}
module button(color, location) {
    translate([location[0], location[1], 2]) {
        color(color)
        cylinder(0.3, 1, 1, $fn = 100);
    }
    translate([location[0], location[1], 2.3]) {
        color(color)
        cylinder(0.15, 0.75, 0.75, $fn = 100);
    }
}
module rocker(location) {
    translate([location[0], location[1], 2]) {
        color("Silver")
        cube([0.55, 1, 0.55]);
    }
    translate([location[0] + 0.55/2, location[1] + 1/2, 2.55]) {
        color("Silver")
        rotate([-12, 0, 0])
        cylinder(0.53, 0.12, 0.2, $fn = 100);
    }
}
module joystick(location) {
    
}
module laptop(location) {
    
}

board();
button("Red", [30, 5]);
slider([35, 5]);
rocker([20, 5]);