include <config.scad>

finished_front_block_y = cube_y * 2;
finished_front_block_z = cube_z;
finished_front_block_x = rbearing_depth+padding;

module front_block() {
    difference(){
        cube(size=[rbearing_depth+padding, cube_y, cube_z]);
        union(){
            translate([0, padding + rbearing_od /2 , ((cube_z) / 2)])
                rotate([0,90,0])  
                    cylinder(d1=rbearing_od, d2=rbearing_od, h=rbearing_depth);
            translate([0, padding + rbearing_od /2 , ((cube_z) / 2)])
                rotate([0,90,0])  
                    cylinder(d1=rbearing_id, d2=rbearing_id, h=rbearing_depth + padding);
            
        }
    }
}

module finished_front_block(){
         union(){
             front_block();
             rotate([180,0,0])
                  translate([0, -cube_y * 2,-cube_z])
                  front_block();
         }
}

//finished_front_block();