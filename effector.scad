include <config.scad>
include <front_block.scad>
include <e3d_v6_all_metall_hotend.scad>

platform_height = 5;

module base(){
    color([1,0,0])
        finished_front_block();

    rotate([0,180,60])
        translate([0,0,-finished_front_block_z])
        color([0,1,0])
            finished_front_block();
        
    rotate([0,0,120])
        translate([sin(60) * finished_front_block_y,-cos(60) * finished_front_block_y, 0])
            color([0,0,1])
                finished_front_block();
}


module platform() {
difference(){
    linear_extrude(height=platform_height)
        union(){
            polygon(points=[[0,0],
                            [0,finished_front_block_y],
                            [-sin(60) * finished_front_block_y,cos(60) * finished_front_block_y]], paths=[[0,1,2]]);
            projection() base();
        };
            translate([-cos(60) * finished_front_block_y / 2, 
                finished_front_block_y / 2, 0])
            cylinder(d1=lbearing_od, d2=lbearing_od, h=platform_height);
    }
}

//color("purple")
//    translate([-cos(60) * finished_front_block_y / 2, 
//                finished_front_block_y / 2, finished_front_block_z - platform_height])
//            cylinder(d1=lbearing_od, d2=lbearing_od, h=platform_height*3);

module effector() {
translate([0,0,cube_z])
    platform();
base();

translate([-cos(60) * finished_front_block_y / 2, 
                finished_front_block_y / 2, finished_front_block_z+ platform_height + 15])
rotate([180,0,0])
e3d();
}