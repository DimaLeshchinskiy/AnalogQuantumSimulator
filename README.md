# Single-qubit optical simulator

A DIY polarization-based quantum-gate analog that turns two-dimensional state vectors into removable optical elements and visible PBS output spots.

> **This is a classical coherent-polarization experiment, not a quantum computer or a single-photon experiment.** Jones vectors reproduce single-qubit mathematics; this apparatus demonstrates no entanglement or quantum computational advantage.

> **Hero photo pending:** an angled view of the assembled apparatus. See the [photography checklist](images/README.md); no experimental photographs are included yet.

## What was built

The builder wanted to connect quantum-information notation to a physical experiment, particularly the one-input Deutsch–Jozsa principle. The apparatus uses a laser, linear polarizers (LP), half-wave plates (HWP), quarter-wave plates (QWP), a polarizing beam splitter (PBS), and printed removable foil cassettes.

- Indexed holders provide designed **22.5° steps**.
- The owner reports **five positions and seven cassettes** (3 HWP, 2 QWP, 2 LP). The saved CAD shows **four indexed holders**; the built inventory awaits photographs.
- Visible PBS spots supported the final qualitative demonstrations.
- A custom detector/controller PCB was designed and assembled, with controller/LED tests reported; the photodiode readout remained unfinished.

```text
Laser → LP: prepare input → wave plates: gates / phase oracle → PBS ┬→ H spot
                                                                └→ V spot
```

H and V label calibrated polarization channels, not assumed transmission/reflection directions.

## Six demonstrations

Ideal ratios below mean normalized classical intensities for H input. “Observed” means the builder's qualitative account, not a calibrated dataset.

| Experiment | Ideal H/V output | Status |
| --- | --- | --- |
| 1. LP preparation and PBS analysis | H: 100/0; V: 0/100 | Observed |
| 2. Hadamard analog, HWP at 22.5° | 50/50 | Observed |
| 3. Two Hadamards | 100/0 | Approximate return observed |
| 4. NOT and double NOT | X: 0/100; XX: 100/0 | Observed with leakage and sequence differences |
| 5. One-bit Deutsch–Jozsa phase oracle | Constant: 100/0; balanced: 0/100 | Qualitative distinction observed |
| 6. QWP relative phase, with basis change | Before: both 50/50; after: 100/0 versus 50/50 | **Planned; unconfirmed** |

## Read and reproduce

1. [Theory: from polarization to a qubit](docs/01-theory.md)
2. [Optical components as gates](docs/02-optical-components.md)
3. [Hardware and the development story](docs/03-hardware-and-development.md)
4. [Six experiment procedures](docs/04-experiments.md)
5. [Limitations and lessons](docs/05-limitations-and-lessons.md)

Start with H/V preparation, reference every plate angle to the optical axis, then follow the experiment chains. The optical demonstrations require no electronic readout. [CAD and printing](construction/README.md), [KiCad files](electro/main/), [preserved design history](docs/evidence/README.md) and [evidence notes](docs/verification-notes.md) document the available artifacts.

**Firmware status:** no original sketch or binary was recovered. The [illustrative, unverified reference](firmware/reference/attiny13a_reference_reconstruction.ino) is not historical firmware and was not flashed. See the [firmware history](docs/03-hardware-and-development.md#firmware-implementation-and-source-preservation).

The ATtiny13A/TS912 board represents real engineering work: Nano ISP programming, button/PWM checks and corrected LED orientation are reported. The two BPW34 detectors were not fully integrated, so there are no verified electronic intensity measurements. The project closed after achieving its optical teaching goal.

**Laser safety:** never look into the beam or specular reflections; use suitable beam stops and laser safety practices. The installed laser's wavelength and power are unverified.
