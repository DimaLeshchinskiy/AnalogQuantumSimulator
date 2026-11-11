include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <../core/mount_interface.scad>;
use <../core/fasteners.scad>;


// Fixed print: an indexed ring permanently fused to the shared profile mount.
module paper_holder(y=0) {
    mount_base_diff = rotation_mount_base_y_extra;
    
    holder_height=15;
    holder_height_back=30;
    holder_width=mount_base_size[0]/2;
    holder_thickness=3;
    
    leg_height=5;
    
    union() {
        profile_mount(y=y, base_size=[mount_base_size[0], mount_base_size[1]+mount_base_diff, mount_base_size[2]], leg_size=[mount_leg_size[0]+10, mount_leg_size[1]+5, leg_height]);
        
        translate([beam_x, holder_thickness/2-(mount_base_size[1]+mount_base_diff)/2, beam_z+holder_height_back/2-20])
        cube([holder_width, holder_thickness, holder_height_back], center=true);
        
        translate([beam_x, holder_thickness/2-(mount_base_size[1]+mount_base_diff)/2+5, beam_z+holder_height/2-20])
        cube([holder_width, holder_thickness, holder_height], center=true);
    } 
    
}

// Placement-only helper; use the three modules above for print exports.
module paper_holder_assembly(y=0, show_cassette=true, show_hardware=true) {
    mount_base_diff = rotation_mount_base_y_extra;
    paper_holder(y=y);
}

paper_holder_assembly();
