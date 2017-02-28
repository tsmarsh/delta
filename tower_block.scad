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
                       cylinder(d1=rbearing_od, d2=rbearing_od, h=rbearing_depth);
              translate([0, lbearing_od + (2*padding), 0])
                cube(size=[cube_x - rbearing_depth - padding, cube_y - lbearing_od - (2 * padding), cube_z]);
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

module bearing(od, id, height, c) {    
     difference(){
          color(c)
               cylinder(d1=od, d2=od, h=height);
          color(c)
               translate([0,0,-1])
               cylinder(d1=id, d2=id, h=height + 2);
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

module finished_block(){
         union(){
             block();
             rotate([180,0,0])
                  translate([0, -cube_y * 2,-cube_z])
                  block();
         }
}

module finished_edge(){
     edge();
     rotate([180,0,0])
          translate([0, -cube_y * 2,-edge_height])
          edge();  
}

module edge(){
     difference(){
          cube(size=[cube_x + rbearing_depth + padding, cube_y, edge_height], color=[0,1,0]);  
        union(){ 
          translate([cube_x - (lbearing_od / 2) - rbearing_depth, lbearing_od / 2 + padding
                     , 0])
               cylinder(d1=lbearing_id, d2=lbearing_id, h=edge_height);
                          translate([0, lbearing_od + (2*padding), 0])
                cube(size=[cube_x - rbearing_depth - padding, cube_y - lbearing_od - (2 * padding), cube_z]);
            
        }
     }
}


translate([0,0,cube_z])
finished_edge();

finished_block();

translate([0,0])
finished_edge();


