# Evidence and verification notes

[Project](../README.md) · [Development history](03-hardware-and-development.md)

This record separates inspected design evidence from the builder's account supplied in the [documentation brief](../CODEX_OPTICAL_SIMULATOR_DOCUMENTATION_BRIEF.md) and [firmware addendum](../CODEX_FIRMWARE_RECOVERY_ADDENDUM.md). A design file establishes intended geometry or connectivity, not what was assembled or measured.

| Claim | Evidence | Status |
| --- | --- | --- |
| Indexed removable cassette geometry; 22.5° steps | [Rotation modules](../construction/parts/rotation_plate.scad), [parameters](../construction/config/parameters.scad): 16 index positions | Verified design |
| Five positions | Brief; [saved assembly](../construction/assemblies/full.scad) instantiates four indexed holders | Discrepancy; built count needs a photo |
| Three HWP, two QWP, two LP | Brief only | Reported configuration; inventory unverified |
| Installed laser wavelength/power, foil models | No purchase record or installed-device identification found | Unconfirmed |
| ATtiny13A-S, TS912, two LED/resistor pairs, button and detector sockets | [BOM](../electro/main/main.csv), [schematic](../electro/main/main.kicad_sch), [PCB](../electro/main/main.kicad_pcb) | Verified design |
| Amplifier feedback and MCU package-pin mapping | KiCad-exported schematic netlist, cross-checked against PCB pad nets | Verified design; no analog test result |
| LED drive active high; button shorts PB2 to ground | D3/D4 cathodes on GNDD, R1/R2 from PB0/PB1; SW1 connectivity | Verified design; original software settings unknown |
| Supply topology | Two cell symbols, SW2, unnamed TPS1, VCC net and J3 naming | Design only; converter model and voltage unconfirmed |
| Board assembled, Nano ISP upload, four states/PWM tested, reversed LEDs corrected | Owner account in both briefs | Reported historical bench validation |
| Original source absent from available material | Full recovery search below | No original recovered |
| Detector integration unfinished; no calibrated dataset | Brief and addendum; no data files found | Reported integration status |
| Optical experiments 1–5, leakage and crossed-plate observation | Brief only | Qualitative owner observations |
| QWP phase experiment | Brief labels it proposed | Planned, no completed result |

## Firmware recovery scope

Inspection on 11 November 2026 covered hidden, ignored and untracked files, the initially empty `firmware/` directory, source/build filenames (`.ino`, `.c`, `.cpp`, `.h`, `.hex`, `.elf`, `.eep`, Arduino/PlatformIO configuration and related artifacts), and text searches for ATtiny, Arduino/ISP, PWM, BPW34, button and LED.

The outer Git repository began with an unborn `main`, no objects, branches with commits, reflog entries or recoverable commits. `git ls-remote origin` succeeded without advertised refs. The hidden KiCad repository was separately audited across refs, reflogs and all stored objects, including dangling commits. Its 630 commit objects mention only two KiCad filenames; all 576 blobs are KiCad schematic/PCB content.

All 21 entries in `electro/main/main.zip` were listed and checked: design snapshots, project/library files and fabrication exports, with no firmware. Its schematic, PCB, library and Gerber copies match their working counterparts; project/preference files differ. The [history bundle](evidence/README.md) preserves the recovered design history. No claim is made about unrelated folders, cloud backups or the chip's flash; hardware was not accessed.

## Remaining evidence

The [photo checklist](../images/README.md) covers the apparatus, true holder count, cassette labels, board, programming setup and output configurations. An original sketch or upload/build log would resolve firmware semantics and settings. Installed optical labels or purchase records would identify wavelength and retardance specifications. These additions would strengthen the record; none is required to close the documented qualitative project.

No calibrated measurements are required for the current claims. Any later numerical intensity, contrast or fidelity claim would need detector calibration, a recorded procedure and actual data. Keep the QWP experiment marked planned unless performed and confirmed.
