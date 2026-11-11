include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <../core/mount_interface.scad>;

module laser_holder(y=0, bore_d=laser_diameter+0.35, clamp_od=12) {
    optical_y = optical_mount_y(y);
    mount_base_diff = rotation_mount_base_y_extra;
    difference() {
        union() {
            profile_mount(y=y, base_size=[mount_base_size[0], mount_base_size[1]+mount_base_diff, mount_base_size[2]], leg_size=[mount_leg_size[0], mount_leg_size[1] + mount_base_size[1] + mount_base_diff/2, mount_leg_size[2]]);
            translate([beam_x, y- (mount_base_size[1]+mount_base_diff)/2, beam_z]) ycyl(l=30, d=clamp_od, anchor=FRONT);
        }
        translate([beam_x, y-0.1- (mount_base_size[1]+mount_base_diff)/2, beam_z]) ycyl(l=30.2, d=bore_d, anchor=FRONT);
        // Open slit lets the 8 mm module snap into the clamp.
        translate([beam_x, y-0.1- (mount_base_size[1]+mount_base_diff)/2, beam_z+clamp_od/2-1]) cuboid([3,30.4,4], anchor=FRONT);
    }
}

module laser_visual(diameter=laser_diameter, length=laser_length) {
    rotate([180,0,0]){
        color("black") ycyl(l=length, d=diameter, anchor=CENTER);
        color("lime") translate([0,-length/2-diameter/8,0]) sphere(d=diameter/3);
    }
}
laser_holder(0);
