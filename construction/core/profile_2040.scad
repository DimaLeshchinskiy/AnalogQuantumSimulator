include <../config/parameters.scad>;
use <OpenSCAD_AluminumExtrusionProfile_Library/AluminumExtrusionProfile.scad>;

// 40x20 V-slot, positioned exactly at X=0..40, Y=0..length, Z=0..20.
module profile_2040(length=profile_length_default, show_color=true) {
    if (show_color) color("dimgray")
    translate([profile_width/2, 0, profile_height/2])
        rotate([-90, 0, 0])
            linear_extrude(height=length)
                2040_extrusion_profile(slot="v");
}
