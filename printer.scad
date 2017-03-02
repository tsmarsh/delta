include <config.scad>
include <base.scad>
include <effector.scad>
include <tower_block.scad>
include <Nema17.scad>

translate([0,25,30])
plywood();

translate([0,20,700])
plywood();

translate([0,20,300])
effector();


module towers(){
    union(){
    translate([30,180,-28])
        cylinder(d1=8, d2=8, 728);
        translate([-30,180,-28])
        cylinder(d1=8, d2=8, 728);
        
        translate([-cube_y, 165+cube_x,450])
        rotate([0,0,270])
        tower_block();
    }
}

towers();
rotate([0,0,120])
towers();

rotate([0,0,-120])
towers();
