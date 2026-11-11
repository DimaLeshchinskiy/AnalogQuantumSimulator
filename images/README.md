# Photography checklist

[Project](../README.md) · [Experiments](../docs/04-experiments.md)

No experimental photographs are currently included. The names below reserve future files; they are text placeholders, not broken image links. Add real photographs or genuine CAD/schematic exports, then embed them with meaningful alt text.

For each image, supply a caption with the beam direction, cassette order, nominal axes relative to calibrated H/V, channel labels, and whether it shows the setup, spots or both. Mark CAD/schematic exports as design views. Camera brightness, even with matched exposure, is not calibrated photometry.

1. `hero-overview.jpg` — angled view of the assembled apparatus, including the whole rail and PBS outputs. Caption: apparatus overview and which subsystems are connected.
2. `optical-chain-labeled.jpg` — laser-to-PBS view with occupied and empty positions labeled. Caption: actual holder count and example optical chain.
3. `cassette-detail.jpg` — removable cassettes, foil labels and indexing mechanism. Caption: identify LP/HWP/QWP, inventory counts and optical-reference marks.
4. `cad-design.png` — genuine CAD overview or exploded cassette assembly. Caption: saved design with four indexed holders; distinguish it from the reported built configuration.
5. `pcb-front.jpg` — board component side. Caption: actual assembly, component labels and detector connection status.
6. `pcb-back.jpg` — reverse side. Caption: soldering and any visible assembly corrections; do not infer an undocumented revision.
7. `pcb-schematic.png` — readable export from the actual KiCad schematic. Caption: intended two-channel circuit, not a measured readout.
8. `firmware-programming.jpg` — Arduino Nano ISP setup, only if a real photo exists. Caption: identify programmer and target without asserting unrecorded fuse/core settings.
9. `exp-01-h.jpg` and `exp-01-v.jpg` — LP(H) and LP(V) with PBS spots. Caption: basis/channel identification.
10. `exp-02-hadamard.jpg` — LP(H), HWP(22.5°), PBS. Caption: qualitative comparison of both spots.
11. `exp-03-h-squared.jpg` — LP(H), two HWPs at 22.5°, PBS. Caption: sequence and return toward H.
12. `exp-04-not.jpg` — LP(H), HWP(45°), PBS. Caption: swapped bright channel and visible leakage, if captured.
13. `exp-04-double-not.jpg` — LP(H), two HWPs, PBS. Caption: identify +45°/+45° or +45°/−45° and the actual plates used.
14. `exp-05-dj-constant.jpg` — LP(H), Hadamard, empty/identity oracle, Hadamard, PBS. Caption: constant case and output.
15. `exp-05-dj-balanced.jpg` — same sequence with HWP(0°) oracle. Caption: balanced Z case and output.
16. `exp-06-qwp-before-analysis.jpg` and `exp-06-qwp-after-analysis.jpg` — **only if performed and confirmed**. Show A/B comparisons with and without QWP, before and after the final HWP analyzer. Caption: full settings, setup/spots shown and qualitative observations.

Never look into the beam or specular reflections while framing a shot; use suitable beam stops and laser safety practices. No additional measurement campaign is needed for the documented qualitative claims.
