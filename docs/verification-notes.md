# Notes on the surviving evidence

[My project](../README.md) · [The build story](03-hardware-and-development.md) · [Circuit details](electronics-reference.md)

I have written the main chapters as my account of the project. Here I keep track of what is visible in the files and photographs, what comes from my experience at the bench, and what I no longer know.

| Detail | What I have |
| --- | --- |
| Five cassette positions; 3 HWP, 2 QWP, 2 LP | The labeled inventory and five holders are visible in `images/full_setup.jpg`. The saved CAD contains four holders. |
| 22.5° indexing | Sixteen positions in the [rotation geometry](../construction/parts/rotation_plate.scad) and [parameters](../construction/config/parameters.scad). This does not measure foil-axis accuracy. |
| Laser power supply and initial orientation | I use a 3 V power supply. The laser is polarized; I orient it for roughly 50/50 with the PBS before inserting cassettes. This is my practical setup, not a calibrated polarization measurement. |
| Optical specifications | I have not established the installed laser's wavelength/optical power or the exact foil models. |
| Controller and amplifier circuit | [BOM](../electro/main/main.csv), [schematic](../electro/main/main.kicad_sch) and [PCB](../electro/main/main.kicad_pcb), with netlist and pad-net cross-checks. |
| Programming and debugging | I successfully used Nano ISP, tested four states/button/PWM, and corrected reversed LEDs. I did not preserve the original program or a test log. |
| Detector integration | I did not complete the photodiode readout or record calibrated intensity data. |
| Gate experiments | My observations and photographs in [the experiment chapter](04-experiments.md); percentages are ideal predictions or explicitly labeled visual estimates. |
| QWP comparison | Four A/B photographs. After the analyzer, my visual estimates were about 80/20 without QWP and 40/60 with it; these are not detector measurements. |

## Firmware recovery scope

The repository inspection on 11 November 2026 covered hidden, ignored and untracked files, the initially empty `firmware/` directory, Arduino/PlatformIO configuration, C/C++ and sketch source, and build artifacts such as HEX/ELF/EEP files. It also searched for ATtiny, Arduino/ISP, PWM, BPW34, button and LED references.

At that inspection the outer Git repository had an unborn `main` with no stored history, and the configured remote advertised no refs. The nested KiCad repository was checked separately across refs, reflogs and all stored objects, including dangling commits. Its 630 commit objects mention only `main.kicad_sch` and `main.kicad_pcb`; all 576 blobs contain KiCad data.

The 21 entries in `electro/main/main.zip` contain design snapshots, project/library files and fabrication exports, with no firmware. Its schematic, PCB, library and Gerber copies match the working versions; project/preference files differ. The [portable history bundle](evidence/README.md) preserves the recovered design development.

No original sketch or firmware binary was found in that material. This does not rule out a copy on another device or backup, and the chip's flash was not accessed.

I retain the reconstruction only as an unverified reference. No numerical fidelity or calibrated photometry follows from the photographs. An original sketch, upload log or installed-component identification would fill gaps in the record, but I am not treating those gaps as a reason to restart the project.

---

**Next appendix:** [Preserved KiCad history](evidence/README.md) →
