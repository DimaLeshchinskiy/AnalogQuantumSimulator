# Hardware and development

[Project](../README.md) · [Components](02-optical-components.md) · [Experiments](04-experiments.md)

## From matrices to an apparatus

The project began, according to the builder's account, around August 2026 while studying quantum informatics at CTU FIT. The aim was to make state preparation, gates and the one-input Deutsch–Jozsa principle tangible. Polarization supplied a physical two-component field on which the same matrices could act.

An early concept was largely passive: a few optical elements, alternative oracle arrangements and paper targets. It developed into a reusable apparatus with removable optical foils, printed holders and an optional electronic readout. These were stages of one educational project. Easy gate swapping, repeatable angles, portability, visible outputs and limited time were retrospective design priorities; no formal requirements document survives.

## CAD, printing and assembly

The [OpenSCAD assembly](../construction/assemblies/full.scad) places a laser, indexed cassette holders and a PBS on a main rail, with detector holders on the transmitted and reflected branches. [Shared parameters](../construction/config/parameters.scad) and [mounting geometry](../construction/core/mount_interface.scad) organize the design. Separate [print entry points](../construction/print/) distinguish printable parts from assembly previews containing optics and fasteners. The existing [construction guide](../construction/README.md) describes the library dependencies and export workflow.

The [rotation assembly](../construction/parts/rotation_plate.scad) has a stator, removable rotor and foil cassette with matching attachment holes. Sixteen stator index positions give $360^\circ/16=22.5^\circ$ spacing. This verifies the designed indexing, rather than its printed accuracy or the foil's optical zero. The builder reports modeling and printing the parts and ordering screws, nuts and other small hardware.

**Configuration discrepancy:** the builder reports five swappable optical positions, but the saved assembly instantiates **four** indexed holders at `rotation_holder_y = [72, 134, 196, 258]`. Neither the CAD nor the available preview establishes a fifth holder. The reported seven-cassette set—three HWP, two QWP and two LP—also lacks a photographed inventory. These distinctions remain explicit throughout the documentation; no CAD was changed to match the account. All six experiments need at most four cassette positions.

The reported optical assembly uses LP, HWP and QWP foils, a laser and PBS. The repository contains their mechanical accommodation, but no optical purchase records or installed-device specifications. A considered laser order does not identify the installed laser; wavelength, power and foil models remain unconfirmed. The reason for selecting foil optics was not recorded.

> **Images pending:** `cad-design.png` should show the assembly and cassette stack; `cassette-detail.jpg` should show the printed indexing and labeled foils. See the [shot list](../images/README.md).

## Why add electronics?

The PBS spots made the gate action visible. Two detector channels offered a route to more objective comparisons than judging brightness by eye, with a button and LEDs providing a small local interface. The builder designed and assembled a custom board. The surviving [schematic](../electro/main/main.kicad_sch), [PCB](../electro/main/main.kicad_pcb), [BOM](../electro/main/main.csv), placement files and [fabrication outputs](../electro/main/gerber/) document substantial design work. Assembly and successful controller testing are owner-reported events; fabrication files alone do not prove them.

### Recovered design history

The root repository initially had no commits, but KiCad's hidden local-history repository contained 588 commits reachable through its saved refs and 630 commit objects when reflog history was included. Its 576 blob objects contain only schematic and PCB data. A [portable bundle and reading guide](evidence/README.md) preserve that evidence, including the additional reflog objects.

The table groups inspected saved states rather than claiming formal PCB revisions. Dates come from the recorded commit timestamps, in Prague summer time; no programming or assembly dates can be inferred from them.

| Recorded stage | Source states | What changed in the design |
| --- | --- | --- |
| 29 August 2026, initial circuit | `b352ba7`, `75e9ca0`, `3ce7f46`, `10edf8c` | ATtiny13A-S, TS912 and BPW34 symbols appeared, followed by a button, LED/resistor pairs and a six-pin programming connector. |
| 29 August, supply exploration | `ae8c72d`, `cdcf382`, `6cf8eac` | An initially mostly unconnected TPS63000 symbol was added and removed; an unnamed three-terminal `TPS1` supply block followed. This does not establish the installed converter model. |
| 29 August, detector interface | `3ba1aa1`, `502482f`, `9b6de96` | Feedback values changed from 100 kΩ to 10 kΩ. External detector connectors evolved into the two three-pin BPW34/shield sockets. |
| 29 August, service access | `e35c4f0` through `563d900` | Supply/ground and analog-output test points were added. |
| 30 August, power and filtering | `7108ad6`, `48caf2d` | Two series cell symbols replaced the earlier battery representation; both feedback capacitors changed from 47 pF to 100 nF. |
| 30–31 August, grounding and layout | `3f3a964` through `f199ae3` | Separate analog, digital and power ground nets were joined through a three-way net tie; further PCB saves survive. |

The snapshots show iteration, including incomplete intermediate connections. They do not record the motivations for the feedback-value changes, measured analog performance or a count of manufactured boards. The current files, local-history tip and archived schematic have matching netlist connectivity.

### What the current electronics files establish

`U1` is **ATtiny13A-S** and `U2` is labeled **TS912**, with two amplifier channels in one SOIC-8 footprint. No more specific TS912 ordering suffix is recorded. The [ST datasheet](https://www.st.com/resource/en/datasheet/ts912.pdf) identifies TS912 as a dual operational amplifier.

Each channel has its noninverting input at `GNDA`, a detector-cathode socket connection at its inverting input, and feedback from output through **10 kΩ in parallel with 100 nF**. This is a transimpedance arrangement. `J7` feeds U2 pins 2/1 and then PB4; `J6` feeds U2 pins 6/7 and then PB3. Socket pins 2 and 3 connect to analog ground for the anode and shield. The current BOM lists these external sockets rather than populated BPW34 devices on the main board.

```text
J7 detector input → TS912 channel A → PB4 analog-input net ┐
J6 detector input → TS912 channel B → PB3 analog-input net ├→ ATtiny13A → LEDs
                                                button ─┘
```

This diagram describes intended circuit connectivity. It does not claim that the original firmware sampled the ADC or converted light into LED brightness.

| U1 physical pin | Port / recorded net | Schematic and PCB connection |
| --- | --- | --- |
| 1 | PB5 / `PB5_RST` | Reset, programming connector J1.5 |
| 2 | PB3 / `PB3_ADC_PHOTO` | U2 channel B output, TP4 |
| 3 | PB4 / `PB4_ADC_PHOTO` | U2 channel A output, TP3 |
| 4 | GND / `GNDD` | Digital ground |
| 5 | PB0 / `PB0_MOSI_LED` | R1 (330 Ω), D3 anode; J1.4 |
| 6 | PB1 / `PB1_MISO_LED` | R2 (330 Ω), D4 anode; J1.1 |
| 7 | PB2 / `PB2_SCK_BUTTON` | SW1 to digital ground; J1.3 |
| 8 | VCC | Supply; J1.2 |

Both LED cathodes connect to digital ground: the **schematic drive is active high**. SW1 grounds PB2 when pressed; no external pull-up is shown. An internal pull-up would provide a suitable idle level, but its use in the lost firmware is unknown. PB0 and PB1 can provide hardware PWM through OC0A and OC0B respectively, according to the [Microchip datasheet](https://ww1.microchip.com/downloads/aemDocuments/documents/MCU08/ProductDocuments/DataSheets/ATtiny13A-Data-Sheet-DS40002307A.pdf); that capability does not prove the historical implementation used those timers.

J1 is wired 1=MISO, 2=VCC, 3=SCK, 4=MOSI, 5=reset, 6=digital ground. These are package pins and circuit nets, **not Arduino sketch pin numbers or verified Nano jumper instructions**.

The supply drawing has two series cells, SW2 and the unnamed `TPS1` block. `VCC` supplies controller, amplifier and laser connector; J3's value includes `VOUT_3V`. This is a design label, not a measured rail voltage. `NT1` ties `GNDA`, `GNDD` and `GNDPWR`. The supply block has no identified part value or board footprint, so the files cannot establish its installed regulator, battery chemistry or actual output voltage.

> **Images pending:** `pcb-front.jpg`, `pcb-back.jpg`, `pcb-schematic.png`; capture the real board and label schematic exports as design evidence.

## Firmware implementation and source preservation

The owner reports successfully programming the ATtiny13A using an **Arduino Nano configured as ISP**. In this workflow the Nano acts as programmer, passing the target program over the ISP signals; the ATtiny runs that program independently afterward. The six-pin connector supports that intended workflow. The actual Arduino core, upload command, clock selection and fuse values were not preserved. A small controller suits a button/two-LED interface, but that selection rationale is an inference.

The historical account confirms **four operating states**, button handling, mode switching and PWM/LED behavior tested by the builder. It does not identify the four modes' meanings, their timing or their relationship to detector inputs. During assembly debugging, the LEDs were initially installed in reverse orientation. Correcting their physical orientation made the indicators work. No recorded test trace supports a more detailed fault diagnosis.

**The original firmware was not recovered.** The search covered all visible and hidden repository files, untracked files, Arduino/PlatformIO and C/C++ source/build extensions, `main.zip`, root Git metadata, and every object in the nested KiCad history. No historical sketch, HEX image or other firmware binary was found. The configured remote advertised no refs at inspection. This finding is limited to the repository and its configured remote, not every computer or storage device the builder may have used.

The supplied [reference sketch](../firmware/reference/attiny13a_reference_reconstruction.ino) is an **illustrative, unverified reconstruction**, preserved byte for byte. It demonstrates a debounced button, four example LED patterns and software PWM. Those patterns are not historical modes. Its default pin numbers are examples; the confirmed schematic does not establish the Arduino core's numbering or the original code's pin mapping. Its compilation guard remains in place.

The sketch is not a photodiode measurement program. It was neither compiled nor flashed, and no claim is made that it fits ATtiny13A flash/RAM or works with a selected core. The [firmware status](../firmware/README.md) records these boundaries. Recovering the original later would require a provenance review and documentation update.

## Integration, experiments and the stopping point

Controller success and detector-readout success were different milestones. The owner tested the button and LED behavior, but the two BPW34 detectors were not fully wired/soldered into the optical measurement chain. There is no verified end-to-end detector dataset, calibration or intensity-readout result.

Optical work proceeded with visible PBS spots: the Hadamard analog split an H input, two Hadamards approximately restored it, and a nominal X gate swapped the bright output with residual leakage. The one-bit phase-oracle demonstration distinguished constant and balanced configurations qualitatively. Composed plates exposed state- and sequence-dependent contrast. A crossed +45°/−45° pair appeared to return the input better than some same-orientation pairs; retardance-error compensation remains a hypothesis.

Finishing the readout would have quantified these effects, but detector calibration would not repair the wave plates. The builder closed the project once the educational objective had been met. The electronics remain a designed, assembled and partially validated subsystem, with optical integration unfinished.

## Decision log

| Decision | Alternatives | Motivation and consequence | Evidence |
| --- | --- | --- | --- |
| Use a classical polarization analog | A genuinely quantum implementation | Directly connect matrices to visible transformations; no claim of quantum computation | Owner's educational aim |
| Make foils removable | Fixed optical sequence | Reuse components across experiments; cassette axes still need a reference | CAD and owner account |
| Index rotation in 22.5° steps | Continuous adjustment | Convenient gate settings; fine angular correction is limited | Geometry verified; convenience rationale inferred |
| Develop detector electronics | Visual comparison alone | Seek objective output comparison; substantial unfinished integration work | Circuit files and owner account |
| Demonstrate with visible spots | Finish and calibrate readout first | Sufficient for the intended qualitative lessons; no numerical fidelity claim | Owner account |
| Close the scope | Further optical/mechanical/PCB development | Preserve the achieved teaching result and lessons | Owner's stated decision |

The lasting engineering lessons are to separate mechanical markings from optical axes, check composed gates as well as isolated ones, preserve firmware alongside hardware, and validate controller, analog circuit and optical chain as distinct subsystems. Modularity made experiments reusable; scope control made the final educational record achievable.
