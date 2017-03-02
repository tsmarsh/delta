radius = 175; // pretty close to 150/cos(30)
radius2 = radius/cos(30);
radius3 = radius2/cos(30)/2;
offset = 150-radius;
thickness = 9;

module plywood() {
  difference() {
    intersection() {
      cube([2*radius, 300, 9], center=true);
      translate([0, offset, 0]) rotate([0, 0, 30])
	cylinder(r=2*radius, h=20, center=true, $fn=3);
    }
    for (a = [0, 120, 240]) {
      translate([0, offset, 0]) rotate([0, 0, a]) {
	translate([-30, radius-8, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
	translate([30, radius-8, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
      }
    }
  }
}