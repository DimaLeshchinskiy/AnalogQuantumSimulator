include <../config/parameters.scad>;
use <../core/profile_2040.scad>;
use <../core/fasteners.scad>;
use <../parts/pbs_holder.scad>;

show_profile = true;
show_fasteners = true;
show_optics = true;
pbs_y = 110;

if (show_profile) profile_2040();
pbs_holder(y=pbs_y);
if (show_fasteners) m3_tslot_pair(y=pbs_y);
if (show_optics)
    translate([beam_x, optical_mount_y(pbs_y), beam_z]) pbs_visual();
