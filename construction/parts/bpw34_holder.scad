include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <../core/mount_interface.scad>;

module bpw34_header() {

translate([beam_x, -mount_base_size[1]/2, beam_z])
    difference(){
        rotate([-90,0,0])
        cylinder(r=8,h=5.5+mount_leg_size[1]+5);
        
        /*
        translate([0, mount_leg_size[1], 0])
        rotate([-90,0,0])
        cylinder(r=6,h=5.5+10+0.1);
        */
        
        bpw34_hole_size_x=6;
        bpw34_hole_size_y=20;
        bpw34_hole_size_z=5;
        translate([0, mount_leg_size[1], 0])
        translate([0, bpw34_hole_size_y/2, 0])
            cube([bpw34_hole_size_x,bpw34_hole_size_y,bpw34_hole_size_z],center=true);
        
        
        translate([-5/2,-0.1,0])
        rotate([-90,0,0])
        cylinder(r=1.5,h=mount_leg_size[1]+0.2);

        translate([5/2,-0.1,0])
        rotate([-90,0,0])
        cylinder(r=1.5,h=mount_leg_size[1]+0.2);
    }
}

// Simple BPW34 cradle.  The sensitive face is normal to local Y, matching the
// laser axis used by the other holders.  It is therefore reusable on a rotated
// branch without changing the holder itself.
module bpw34_holder(y=0, body_size=bpw34_body_size) {
    mount_base_diff = rotation_mount_base_y_extra;
    union() {
        profile_mount(y=y, base_size=[mount_base_size[0], mount_base_size[1]+mount_base_diff, mount_base_size[2]], leg_size=[mount_leg_size[0], mount_leg_size[1]+7, mount_leg_size[2]-5]);
        translate([0,y-mount_base_diff/2,0])
        bpw34_header();
    }
}

module bpw34_visual(body_size=bpw34_body_size) {
    union(){
        color([0.1, 0.2, 0.45, 0.75])
            cube([4.7,2,4.3],center=true);
        
        color("gray")
        translate([4.7/2,0,-0.7/2])
            rotate([90,0,0])
            cube([0.3,0.7,4.8]);
        
        color("gray")
        translate([-4.7/2,0,0.7/2])
            rotate([90,180,0])
            cube([0.3,0.7,4.8]);
    }   
}
bpw34_holder();
translate([beam_x, 0, beam_z])
bpw34_visual();