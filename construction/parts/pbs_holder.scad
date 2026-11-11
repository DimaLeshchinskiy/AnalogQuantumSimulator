include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <../core/mount_interface.scad>;

// Low corner retainers keep the PBS accessible from above and all four sides.
// Their inner faces remain outside the PBS envelope by corner_clearance.
module pbs_holder(y=0, cube_size=pbs_size) {
    floor_size = cube_size + 2*pbs_floor_margin;
    floor_height = pbs_floor_height;
    floor_y = y + (floor_size-mount_base_size[1])/2;
    
    mount_base_diff = rotation_mount_base_y_extra;
    
    union() {
        profile_mount(y=y, base_size=[mount_base_size[0], mount_base_size[1]+mount_base_diff, mount_base_size[2]], leg_size=[mount_leg_size[0], mount_leg_size[1]+10, mount_leg_size[2]-pbs_mount_leg_height_reduction]);
        
        translate([beam_x, floor_y-mount_base_diff/2, beam_z - floor_height /2 - cube_size/2])
        cube([floor_size, floor_size, floor_height], center=true);
        
        difference() {
        translate([beam_x, floor_y-mount_base_diff/2, beam_z + floor_height /2 - cube_size/2])
        cube([floor_size, floor_size, floor_height], center=true);
            
            translate([-pbs_size/2, -pbs_size/2-mount_base_diff/2, 0])
        translate([beam_x-0.5, floor_y-0.5, beam_z - cube_size/2])
        cube([pbs_size+1,pbs_size+1,pbs_size]);
        }
        
        
    }
}

module pbs_visual(size=pbs_size) {
    color([0.25,0.55,1,0.35]) cuboid([size,size,size], anchor=CENTER);
}


pbs_holder();
