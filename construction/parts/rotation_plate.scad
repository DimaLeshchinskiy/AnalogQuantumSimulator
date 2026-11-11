include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <../core/mount_interface.scad>;
use <../core/fasteners.scad>;

module rotation_rotor_disc() {
    color("orange")
    union() {
        difference() {
            rotate([90,0,0])
            cylinder(r=rotation_outer_d/2,h=rotation_stator_thickness, center=true);
            
            // Inner hole
            rotate([90,0,0])
            cylinder(r=filter_size/2,h=rotation_stator_thickness+0.2, center=true);
            
            translate([-(filter_size/2 + rotation_m3_offset_from_filter),0,0])
            rotate([90,0,0])
            m3_hole();
            
            translate([(filter_size/2 + rotation_m3_offset_from_filter),0,0])
            rotate([90,0,0])
            m3_hole();
            
        }        
        
        // Index holes around the disc - now rotating around Y axis
        for (angle=[0:360/4:359])
            rotate([0, angle, 0])  // Changed from [angle, 0, 0] to [0, angle, 0]
            translate([0,rotation_stator_thickness+0.5,rotation_index_radius])
            rotate([90,0,0])
            cylinder(r=rotation_index_hole_d/2 * 1.37,h=rotation_stator_thickness+1, center=true);
    }
}


module rotation_stator_disc() {
    difference() {
        rotate([90,0,0])
        cylinder(r=rotation_outer_d/2,h=rotation_stator_thickness, center=true);
        
        // Index holes around the disc - now rotating around Y axis
        for (angle=[0:360/rotation_index_count:359])
            rotate([0, angle, 0])  // Changed from [angle, 0, 0] to [0, angle, 0]
            translate([0,0,rotation_index_radius])
            rotate([90,0,0])
            cylinder(r=rotation_index_hole_d/2 *1.5,h=rotation_stator_thickness+0.2, center=true);
        
        // Inner hole
        rotate([90,0,0])
        cylinder(r=rotation_inner_d/2,h=rotation_stator_thickness+0.2, center=true);
    }
        
}

// Fixed print: an indexed ring permanently fused to the shared profile mount.
module rotation_stator(y=0) {
    mount_base_diff = rotation_mount_base_y_extra;
    union() {
        difference() {
            profile_mount(y=y, base_size=[mount_base_size[0], mount_base_size[1]+mount_base_diff, mount_base_size[2]], leg_size=[mount_leg_size[0], mount_leg_size[1]+2, mount_leg_size[2]]);
            
            translate([beam_x, (rotation_stator_thickness-mount_base_size[1]-mount_base_diff)/2 + y, beam_z]) 
            rotate([90,0,0])
            cylinder(r=rotation_outer_d/2,h=rotation_stator_thickness+0.2, center=true);
        }
        
        translate([beam_x, (rotation_stator_thickness-mount_base_size[1]-mount_base_diff)/2 + y, beam_z]) rotation_stator_disc();
    } 
}

module filter_cassette() {
    color("red")
    difference() {
            cube([filter_cassette_size,rotation_stator_thickness,filter_size+filter_cassette_height_extra],center=true);
            
            // Inner hole
            rotate([90,0,0])
            cylinder(r=filter_size/2,h=rotation_stator_thickness+0.2, center=true);
            
            translate([-(filter_size/2 + rotation_m3_offset_from_filter),0,0])
            rotate([90,0,0])
            m3_hole();
            
            translate([(filter_size/2 + rotation_m3_offset_from_filter),0,0])
            rotate([90,0,0])
            m3_hole();

            // The square foil pocket belongs to this red cassette, not to the
            // indexed rotor: the rotor remains a simple, support-free print.
            translate([0,rotation_stator_thickness/2, 0])
            cube([filter_size,1,filter_size], center=true);
        }        
}

// Assembly-only metal hardware for the two cassette attachment holes.
module rotation_cassette_fasteners(rotor_y, cassette_y) {
    bolt_head_y = cassette_y - rotation_stator_thickness/2;
    nut_y = rotor_y + rotation_stator_thickness/2;
    for (side=[-1,1]) {
        bolt_x = beam_x + side*(filter_size/2 + rotation_m3_offset_from_filter);
        // Washer is seated on the exposed cassette face; move both it and the
        // screw outward by its thickness to preserve the complete stack.
        translate([bolt_x, bolt_head_y-m3_washer_thickness, beam_z])
            rotate([90,0,0]) m3_bolt(length=rotation_cassette_bolt_length);
        translate([bolt_x, bolt_head_y, beam_z])
            rotate([90,0,0]) m3_washer();
        translate([bolt_x, nut_y, beam_z])
            rotate([90,0,0]) m3_nut(anchor=TOP);
    }
}

// Placement-only helper; use the three modules above for print exports.
module rotation_plate_assembly(y=0, show_cassette=true, show_hardware=true) {
    mount_base_diff = rotation_mount_base_y_extra;
    stator_y = (rotation_stator_thickness-mount_base_size[1]-mount_base_diff)/2 + y;
    rotor_y = stator_y - rotation_stator_thickness;
    cassette_y = stator_y - 2*rotation_stator_thickness;
    rotation_stator(y=y);
    
    translate([beam_x, rotor_y, beam_z])
        rotation_rotor_disc();
    
    if (show_cassette)
        translate([beam_x, cassette_y, beam_z])
            filter_cassette();
    if (show_cassette && show_hardware)
        rotation_cassette_fasteners(rotor_y=rotor_y, cassette_y=cassette_y);
}

rotation_plate_assembly();
