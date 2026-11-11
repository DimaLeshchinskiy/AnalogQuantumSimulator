# The firmware I did not preserve

[The electronics story](../docs/03-hardware-and-development.md#programming-and-bringing-the-board-to-life) · [Circuit reference](../docs/electronics-reference.md)

I programmed my ATtiny13A through an Arduino Nano acting as ISP. I tested the button, four operating states and PWM/LED behavior, and corrected LEDs that I had installed in reverse. Unfortunately, I did not keep the original sketch.

The [repository search](../docs/verification-notes.md#firmware-recovery-scope) found no original source or firmware binary. I cannot reconstruct the exact mode meanings, ADC behavior, timing, Arduino core, clock or fuses from the surviving hardware files.

The only sketch here, [attiny13a_reference_reconstruction.ino](reference/attiny13a_reference_reconstruction.ino), is an **illustrative, unverified reconstruction**. It is not the program I uploaded. The example debounce interval, pin assignments, LED patterns and software PWM do not establish how my original firmware worked; the sketch does not read photodiodes.

I have kept it unchanged with its compilation guard in place. It has not been compiled, checked for ATtiny13A flash/RAM fit or flashed as part of this documentation work. The circuit's package pins do not establish Arduino pin numbering.

My optical experiments use the PBS spots and work without this firmware or board. If I recover the original later, it belongs here with its programming settings and provenance.
