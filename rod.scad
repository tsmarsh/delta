include <universal_joint.scad>
include <config.scad>

module rod(){
    translate([0,0,rod_radius*.88])
    union(){
    ujoint(r=6);

    cylinder(d1=8, d2=8, h=rod_length);

    translate([0,0,rod_length])
    ujoint(r=6);
    }
}