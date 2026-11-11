include <../config/parameters.scad>;
use <../core/profile_2040.scad>;
use <../core/fasteners.scad>;
use <../parts/laser_holder.scad>;

show_profile = true;
show_fasteners = true;
show_optics = true;
laser_y = 40;

if (show_profile) profile_2040();
laser_holder(y=laser_y);
if (show_fasteners) m3_tslot_pair(y=laser_y);
if (show_optics)
    translate([beam_x, optical_mount_y(laser_y), beam_z]) laser_visual();
