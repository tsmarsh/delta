include <config.scad>
include <front_block.scad> 

module block() {
    rear_block();

    translate([cube_x, 0, 0])
        front_block();
}


module rear_block() {
     difference(){
          color([0,0,1])
               cube(size=[cube_x, cube_y, cube_z], color=[0,0,1]); 
          union(){
               translate([cube_x - (lbearing_od / 2) - rbearing_depth, lbearing_od / 2 + padding
                          , 0])
                    linear_bearing_shaft();
              translate([cube_x - rbearing_depth, padding + rbearing_od /2 , ((cube_z) / 2)])
               rotate([0,90,0])  
                       cylinder(d1=rbearing_od, d2=rbearing_od, h=rbearing_depth * 1.2);
                cube(size=[cube_x - rbearing_depth - padding, cube_y, cube_z]);
              translate([0, padding + lbearing_od + 2 , cube_z / 3])
               rotate([0,90,0])  
                       cylinder(d1=3, d2=3, h=cube_x);
               translate([0, padding + lbearing_od + 2 , 2 * cube_z / 3])
               rotate([0,90,0])  
                       cylinder(d1=3, d2=3, h=cube_x);
              
               translate([cube_x - rbearing_depth - padding, padding/2 , cube_z / 3])
               rotate([320,90,0])  
                       cylinder(d1=3, d2=3, h=cube_x);
               translate([cube_x - rbearing_depth - padding, padding/2 , 2 * cube_z / 3])
               rotate([320,90,0])  
                       cylinder(d1=3, d2=3, h=cube_x);
          }
     }
}

module linear_bearing_shaft(){
     cylinder(d1=lbearing_od, d2=lbearing_od, h=cube_z);
}

module rotating_bearing_shaft() {
     rotate([0,90,0])  
          union(){
          cylinder(d1=rbearing_id, d2=rbearing_id, cube_x+1);
          translate([0,0,cube_x - rbearing_depth + 1])
               cylinder(d1=rbearing_od, d2=rbearing_od, h=rbearing_depth);
     } 
}

module finished_rear_block(){
         union(){
             rear_block();
             rotate([180,0,0])
                  translate([0, -cube_y * 2,-cube_z])
                  rear_block();
         }
}

module tower_block(){
     block();
     rotate([180,0,0])
          translate([0, -cube_y * 2,-cube_z])
          block();
}

tower_block();
