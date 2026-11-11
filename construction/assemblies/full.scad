include <../config/parameters.scad>;
use <../core/profile_2040.scad>;
use <../core/fasteners.scad>;
use <../parts/laser_holder.scad>;
use <../parts/pbs_holder.scad>;
use <../parts/rotation_plate.scad>;
use <../parts/bpw34_holder.scad>;

// Primary workbench: add every future rail-mounted component here.
show_profile = true;
show_fasteners = true;
show_optics = true;

laser_y = 10;
// Four evenly spaced 22.5-degree gates between the laser and PBS.
rotation_holder_y = [72, 134, 196, 258];
pbs_y = 320;
main_detector_y = 370;
// Reflected branch: local Y becomes global +X after the final -90 degree turn.
branch_detector_y = 50;
branch_origin = [profile_width, optical_mount_y(pbs_y)+profile_width/2, 0];

// Flip only the BPW34 module around its own rail-mount datum.  The holder
// remains a single reusable local model for both the main and reflected rails.
module bpw34_holder_in_assembly(y) {
    translate([beam_x, y, 0])
        rotate([0, 0, 180])
            translate([-beam_x, -y, 0])
                bpw34_holder(y=y);
}

module bpw34_visual_in_assembly(y) {
    translate([beam_x, y, beam_z])
        rotate([0, 0, 180])
            translate([0, -mount_base_size[1]/2, 0])
                bpw34_visual();
}

// Keep branch components in their normal local profile coordinates.  The caller
// performs the translation and 90 degree rotation only after this is assembled.
module reflected_branch_assembly(show_rail=true, show_hardware=true, show_optic=true) {
    if (show_rail) profile_2040(length=profile_branch_length);
    bpw34_holder_in_assembly(y=branch_detector_y);
    if (show_hardware) m3_tslot_pair(y=branch_detector_y);
    if (show_optic)
        bpw34_visual_in_assembly(y=branch_detector_y);
}

if (show_profile) profile_2040(length=profile_length_default);

laser_holder(y=laser_y);
for (gate_y=rotation_holder_y)
    rotation_plate_assembly(y=gate_y, show_hardware=show_fasteners);
pbs_holder(y=pbs_y);
bpw34_holder_in_assembly(y=main_detector_y);

if (show_fasteners) {
    m3_tslot_pair(y=laser_y);
    for (gate_y=rotation_holder_y)
        m3_tslot_pair(y=gate_y);
    m3_tslot_pair(y=pbs_y);
    m3_tslot_pair(y=main_detector_y);
}

if (show_optics) {
    translate([beam_x, optical_mount_y(laser_y), beam_z]) laser_visual();
    translate([beam_x, optical_mount_y(pbs_y), beam_z]) pbs_visual();
    bpw34_visual_in_assembly(y=main_detector_y);
}

// The branch starts flush with the right side of the main profile at the PBS.
// Its local assembly is complete before being positioned and rotated in global space.
translate(branch_origin)
    rotate([0, 0, -90])
        reflected_branch_assembly(
            show_rail=show_profile,
            show_hardware=show_fasteners,
            show_optic=show_optics
        );
