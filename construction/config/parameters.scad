// Single source of truth for AnalogSimulator mechanics. Units: mm.

profile_width = 40;             // X
profile_length_default = 400;   // Y, main rail default
profile_branch_length = 100;    // Y in the local reflected-branch frame
profile_height = 20;            // Z
profile_path_x = [10, 30];      // centers of the two top T-slots

beam_x = profile_width / 2;
beam_z = 50;
// Optical components sit 1 mm forward of the rail-mount datum.  Keep this in
// one place so holders and their assembly-preview optics cannot drift apart.
optical_mount_y_offset = 3;
function optical_mount_y(y) = y + optical_mount_y_offset;

print_clearance = 0.25;
m3_clearance_d = 3.4;
m3_washer_od = 7;
m3_washer_thickness = 0.8;
m3_bolt_length = 12;
m3_bolt_head_length = 3;
// Posuvná T-matice M3: šířka napříč drážkou, délka po profilu, výška.
m3_tnut_w = 9.5;
m3_tnut_l = 9.5;
m3_tnut_h = 4.2;
m3_tnut_body_h = 3.1;
m3_tnut_neck_w = 6;
m3_tnut_thread_d = 3;

mount_base_size = [40, 10, 5];
mount_leg_size = [10, 3, 25];
mount_base_bottom_z = profile_height;

laser_diameter = 8;
laser_length = 32;
pbs_size = 10;
pbs_floor_margin = 3;
pbs_floor_height = 2;
pbs_mount_leg_height_reduction = 5;

// Vishay BPW34 body, oriented as [X width, Y optical depth, Z height].
bpw34_body_size = [5.4, 3.2, 4.3];
bpw34_fit_clearance = 0.35;
bpw34_floor_thickness = 2;
bpw34_side_wall_thickness = 1.5;
bpw34_back_wall_thickness = 2;
bpw34_side_height_extra = 0.5;

// 22.5-degree rotation gate: all dimensions are in the YZ plane, with the
// optical axis and rotation axis along X.
rotation_outer_d = 44;
rotation_inner_d = 28;
rotation_stator_thickness = 5;
rotation_rotor_d = 40;
rotation_rotor_thickness = 3;
rotation_index_count = 16;
rotation_index_radius = 18;
rotation_index_hole_d = 2.4;
rotation_foot_d = 2.1;
rotation_foot_length = 1.8;
rotation_gap = 0.3;
rotation_mount_base_y_extra = 15;
rotation_m3_offset_from_filter = 5;
rotation_cassette_bolt_length = 16;
filter_size = 10;
filter_cassette_size = 30;
filter_cassette_thickness = 3;
filter_pocket_depth = 1.4;
filter_aperture_d = 7;
filter_cassette_height_extra = 5;
