include <base.scad>
include <effector.scad>
include <tower_block.scad>

plywood();

translate([0,0,700])
plywood();

translate([0,0,300])
effector();


module towers(){
    translate([30,170,-28])
    cylinder(d1=8, d2=8, 728);
    translate([-30,170,-28])
    cylinder(d1=8, d2=8, 728);
    
}

towers();