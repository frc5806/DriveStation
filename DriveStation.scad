boardWidth = 60;
boardLength = 14;
joyWidth = 8.8;
joyLength = 8.4;
laptopWidth = 12.75;
laptopLength = 9;
sliderWidth = 0.5;
sliderLength = 3.5;
buttonDiameter = 0.69;
rockerWidth = 0.55;
rockerLength = 0.98;

module board() {
    color("BurlyWood")
    cube([boardWidth, boardLength, 2]);
}
module slider(location, vertical) {
    if (vertical) {
        translate([location[0], location[1], 2]) {
            color("DimGray")
            cube([sliderWidth, sliderLength, 0.4]);
        }
        translate([location[0] + sliderWidth/2, location[1] + sliderLength/2, 2.4]) {
            color("Silver")
            cube([0.1, 0.4, 0.2]);
        }
    } else {
        translate([location[0], location[1], 2]) {
            color("DimGray")
            cube([sliderLength, sliderWidth, 0.4]);
        }
        translate([location[0] + sliderLength/2, location[1] + sliderWidth/2, 2.4]) {
            color("Silver")
            cube([0.4, 0.1, 0.2]);
        }
    }
}
module button(color, location, big) {
    if (big) {
        translate([location[0], location[1], 2]) {
            color(color)
            cylinder(0.3, buttonDiameter, buttonDiameter, $fn = 100);
        }
        translate([location[0], location[1], 2.3]) {
            color(color)
            cylinder(0.15, buttonDiameter*2/3, buttonDiameter*2/3, $fn = 100);
        }
    } else {
        translate([location[0], location[1], 2]) {
            color(color)
            scale(0.3, 0.3, 0.3)
            cylinder(0.3, buttonDiameter, buttonDiameter, $fn = 100);
        }
        translate([location[0], location[1], 2.09]) {
            color(color)
            scale(0.3, 0.3, 0.3)
            cylinder(0.15, buttonDiameter*2/3, buttonDiameter*2/3, $fn = 100);
        }
    }
}
module rocker(location) {
    translate([location[0], location[1], 2]) {
        color("Silver")
        cube([rockerWidth, rockerLength, 0.20]);
    }
    translate([location[0] + rockerWidth/2, location[1] + rockerLength/2, 2.20]) {
        color("Silver")
        rotate([-12, 0, 0])
        cylinder(0.53, 0.12, 0.2, $fn = 100);
    }
}
module joystick(location) {
    translate([location[0], location[1], 2]) {
        color("Silver")
        cube([joyWidth, joyLength, 0.2]);
    }
    translate([location[0] + joyWidth/2, location[1] + joyLength/2, 2.2]) {
        color("Black")
        rotate([-10, 0, 0]) {
            translate([0, 0, 0.4]) {
                sphere(2, $fn = 100);
            }
            cylinder(9, 1, 0.5, $fn = 100);
        }
    }
}
module laptop(location) {
    translate([location[0], location[1], 2]) {
        color("Silver") {
            cube([laptopWidth, laptopLength, 0.5]);
            translate([0, 9, 0])
            rotate([85, 0, 0])
            cube([laptopWidth, laptopLength, 0.5]);
        }
    }
}

board();

joystick([0, 0]);
joystick([joyWidth + 0.5, 0]);

laptop([boardWidth/2 - laptopWidth/2, boardLength - laptopLength]);

rocker([2*joyWidth + 2, joyLength/2]);

slider([boardWidth/2 - sliderLength/2, 1], false);

button("Red", [boardWidth/2 - sliderLength/2 - 1, 1.3], false);
button("Red", [boardWidth/2 + laptopWidth/2 + 3, boardLength/2], true);
button("Red", [boardWidth/2 + laptopWidth/2 + 3, 5], true);

button("Yellow", [boardWidth/2 + laptopWidth/2 + 6, boardLength/2], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 6, 5], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 6, 5 - (boardLength/2 - 5)], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 6, boardLength/2 + (boardLength/2 - 5)], true);

button("Yellow", [boardWidth/2 + laptopWidth/2 + 9, 5], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 9, boardLength/2], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 11, 5], true);
button("Yellow", [boardWidth/2 + laptopWidth/2 + 11, boardLength/2], true);

button("Blue", [boardWidth/2 + laptopWidth/2 + 14, 5], true);
button("Blue", [boardWidth/2 + laptopWidth/2 + 14, boardLength/2], true);
slider([boardWidth/2 + laptopWidth/2 + 14 - sliderWidth/2, 0], true);

button("Green", [boardWidth/2 + laptopWidth/2 + 17, 5], true);
button("Green", [boardWidth/2 + laptopWidth/2 + 17, boardLength/2], true);
slider([boardWidth/2 + laptopWidth/2 + 17 - sliderWidth/2, 0], true);

button("Green", [boardWidth/2 + laptopWidth/2 + 20, 5], true);
button("Green", [boardWidth/2 + laptopWidth/2 + 20, boardLength/2], true);
slider([boardWidth/2 + laptopWidth/2 + 20 - sliderWidth/2, 0], true);
rocker([boardWidth/2 + laptopWidth/2 + 22, sliderLength/2]);