include <../config/parameters.scad>;
include <BOSL2/std.scad>;
use <fasteners.scad>;

module profile_mount(y, base_size=mount_base_size, leg_size=mount_leg_size) {
    base_center_z = mount_base_bottom_z + base_size[2]/2;
    difference() {
        translate([beam_x, y, base_center_z])
            cuboid(base_size, rounding=1, edges="Z", anchor=CENTER);
        for (x=profile_path_x)
            translate([x, y, profile_height-0.1])
                zcyl(h=base_size[2]+0.2, d=m3_clearance_d, anchor=BOTTOM);
    }
    // The leg is fused into the base and reaches the common optical height.
    translate([beam_x, y-base_size[1]/2+leg_size[1]/2, profile_height+base_size[2]-0.5])
        cuboid([leg_size[0], leg_size[1], leg_size[2]+0.5], rounding=0.7, edges="Z", anchor=BOTTOM);
    
    color("green")
    for (x=profile_path_x) {
       difference() { 
            translate([beam_x-base_size[0]/2+x-9.5/2, y, base_center_z-base_size[2]/2])
            trapezoid(y, base_size);
           translate([x, y, profile_height-5])
                zcyl(h=base_size[2]+0.2, d=m3_clearance_d, anchor=BOTTOM);
       }
    }
}

// Standard placement wrapper used by every rail-mounted part in assemblies.
module add_profile_mount(y, show_fasteners=false, bolt_length=m3_bolt_length) {
    profile_mount(y=y);
    if (show_fasteners)
        m3_tslot_pair(y=y, bolt_length=bolt_length);
}

profile_mount(0);

module trapezoid(y, base_size=mount_base_size) {
    // Full trapezoid: base1=9, base2=6, height=2
    // Cut at half height (z=1) → new top base = base1 - (base1-base2)/2 = 7.5
    // Offset of sides: (9-6)/2 = 1.5  →  at z=1, each side moved in by 0.75
    // New top base = 9 - 2*0.75 = 7.5mm

    base1 = 9.5;      // bottom base
    base2_new = 7.5;// recalculated top base at half height
    height = 1;     // half of original 2mm
    thickness = base_size[1];  // extrusion along Y
    
    difference() {
        translate([0,-base_size[1]/2,0])
        rotate([-90, 0, 0])
            linear_extrude(height = thickness)
                polygon(points=[
                    [0, 0],
                    [base1, 0],
                    [(base1 - base2_new) / 2 + base2_new, height],
                    [(base1 - base2_new) / 2, height]
                ]);
       }
    
}