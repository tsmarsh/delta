steel = [0.8, 0.8, 0.9];

module bearing(id, od, w) {
    translate([0,w/2,0])
    color(steel) 
    render()
    rotate([90, 0, 0]) difference() {
		cylinder(h=w, r=od/2, center=true);
		cylinder(h=w*2, r=id/2, center=true);
    }
}

module sixOhEight(){
    bearing(8, 22, 7); 
}

module lm8uu() {
    translate([0,0,25/2])
    color(steel) render() difference() {
        cylinder(h=25, r=7.5, center=true);
        cylinder(h=30, r=4, center=true);
    }
}