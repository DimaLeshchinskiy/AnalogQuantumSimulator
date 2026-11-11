include <../config/parameters.scad>;
include <BOSL2/std.scad>;
include <BOSL2/screws.scad>;

module m3_hole(length=10, diameter=3.4) {
    cylinder(
        d=diameter,
        h=length,
        center=true,
        $fn=32
    );
}

// Purchased M3 sliding T-nut.  This is an imported manufacturer/community STL,
// not an approximation generated in OpenSCAD.  The source STL axes are rotated
// so its 10 mm width lies across X, its 10.5 mm length along Y, and its 5.8 mm
// height sits inside the top V-slot with the threaded opening facing upward.
module m3_tnut(y, path=0) {
    /*
    assert(path >= 0 && path < len(profile_path_x), "Invalid profile T-slot path");
    color("silver")
    translate([-5,-5,-6])
        rotate([90, 0, 90])
            import("Nut_Holder_M3mm.STL", convexity=3, $fn=1);
    */
}

// Standard loose M3 hex nut for assembly previews and future mechanisms.
module m3_nut(anchor=TOP, orient=UP) {
    color("silver") nut("M3", thread="none", anchor=anchor, orient=orient);
}

module m3_washer() {
    color("silver") tube(od=m3_washer_od, id=m3_clearance_d, h=m3_washer_thickness, anchor=BOTTOM);
}

module m3_bolt(length=m3_bolt_length) {
    color("silver") 
    translate([0,0,m3_bolt_head_length])
    screw("M3", l=length, head="socket", drive="hex", thread="none", anchor=TOP);
}


// Complete visual mounting stack; only the plastic holder is exported to STL.
module m3_tslot_fastener(y, path=0, bolt_length=m3_bolt_length, show_nut=true) {
    x = profile_path_x[path];
    translate([x, y, profile_height + mount_base_size[2] + m3_washer_thickness])
        m3_bolt(length=bolt_length);
    translate([x, y, profile_height + mount_base_size[2]]) m3_washer();
    
    if (show_nut) 
    translate([x, y, profile_height]) m3_tnut(y=y, path=path);
}

module m3_tslot_pair(y, bolt_length=m3_bolt_length, show_nuts=true) {
    for (path=[0:len(profile_path_x)-1])
        m3_tslot_fastener(y=y, path=path, bolt_length=bolt_length, show_nut=show_nuts);
}
