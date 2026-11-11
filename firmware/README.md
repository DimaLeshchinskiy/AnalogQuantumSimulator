# Firmware status

**The original programmed ATtiny13A firmware was not recovered from the repository.**

The owner reports successful Arduino Nano ISP programming and bench checks of the button, four operating states and PWM/LED control after correcting reversed LED installation. The original mode meanings, ADC behavior, timing, core, clock and fuse settings remain unknown. See the [development history](../docs/03-hardware-and-development.md#firmware-implementation-and-source-preservation) and [recovery audit](../docs/verification-notes.md#firmware-recovery-scope).

The only sketch here is an [illustrative, unverified reconstruction](reference/attiny13a_reference_reconstruction.ino), supplied with the task and relocated without changing its contents. It is **not recovered source, production firmware, or a reproduction of the original modes**. It contains example pin assignments, debounce timing and four LED patterns with software PWM; it does not read photodiodes.

Its compilation guard is intentionally retained. No compilation, resource-fit check or hardware test was performed, and it was not flashed. Schematic package pins are documented, but they do not determine Arduino pin numbering or establish the assembled wiring. The selected core, polarity, button idle state, flash/RAM use and electrical behavior would all need verification before any use.

The optical experiments use visible PBS spots and do not require this board or firmware. If the historical source becomes available, preserve it with its provenance and settings and revise these status notes before treating it as recovered firmware.
