# Addendum for Codex — missing ATtiny13A firmware and documentation

Read this **after** `CODEX_OPTICAL_SIMULATOR_DOCUMENTATION_BRIEF.md`. It supplements that task, rather than replacing it.

## What happened

The owner previously uploaded/programmed an ATtiny13A firmware sketch, but the source code was apparently not saved in the project repository. The original sketch is **not available in this addendum**. The companion `attiny13a_reference_reconstruction.ino` is a **new illustrative reconstruction**, not recovered source. Do not present it as the owner's historical firmware or claim it reproduces the original behavior.

## Facts known from the project history

- Controller: ATtiny13A, programmed successfully using an Arduino Nano configured as ISP.
- The PCB includes a push button and two indicator LEDs; there were four firmware operating states/modes, and PWM was involved.
- Button handling, mode switching, and PWM/LED control were tested and worked after an LED polarity/orientation issue was corrected physically.
- The electronics were designed to support an optical measurement/readout subsystem using two BPW34 photodiodes and TS912 amplifier circuitry.
- The complete photodiode-to-optical-readout system was not integrated into the final demonstrations. Visible laser spots after the PBS were used instead.
- **Unknown**: original pin mapping, exact four mode semantics, ADC usage, PWM frequency/duty cycle, LED polarity in software, clock/fuse settings, debounce timing, analog thresholding, wiring and original code text.

## Instructions: recover first, reconstruct only if necessary

1. Inspect the repository for `.ino`, `.c`, `.cpp`, `.h`, PlatformIO/Arduino files, `.hex`, build artifacts, old branches, git history, untracked files, and commit history. Search by ATtiny13A, ArduinoISP, BPW34, PWM, button, and LED. Do not overwrite anything.
2. If actual firmware is found, **prefer the original**. Preserve it verbatim, link to it from `docs/03-hardware-and-development.md`, and explain its actual behavior after reading it. If only a HEX file exists, do not claim that it reveals the original C source.
3. If no original exists, keep the companion `.ino` in a clearly marked `firmware/reference/` or `firmware/reconstructed/` directory (adapt to repo layout). Its status must be **illustrative, unverified reconstruction**. Do not label it production firmware, do not flash it automatically, and do not invent a precise pinout.
4. Check the PCB schematic, board files, and BOM to determine pin assignments, active-low LED behavior, button pull-up/pull-down and possible PWM pins. A schematic PDF might be image-only; if it cannot be inspected, say so rather than guessing.
5. If the owner later provides the original sketch, replace the reference with that original (after asking permission if needed), update documentation and remove inaccurate reconstruction claims.

## Documentation edits

In `docs/03-hardware-and-development.md`, add a subsection **Firmware implementation and source preservation** explaining:

- Arduino Nano ISP programming workflow and why a small ATtiny13A was selected (the latter only if supported by repo or labeled as inference).
- Four operating modes and PWM as verified historical observations, **without inventing what the modes did**.
- Initial reversed LED installation and successful correction.
- Original firmware source not preserved in the currently available repository, if repo inspection confirms that.
- Difference between validated controller/LED behavior and unfinished photodiode measurement integration.
- Companion reconstruction as a reference only, with a link and a clear warning that pin assignments and mode behavior need verification.

In the root README, include a short **Firmware status** note, ideally linking to the hardware chapter and reference sketch. Do not imply electronics are necessary to reproduce the optical experiments.

## Companion code: purpose and limits

The file `attiny13a_reference_reconstruction.ino` demonstrates a simple debounced button cycling four states and two LED outputs with software PWM. The four **example** display patterns are NOT historically verified. It deliberately requires pin mapping and electrical polarity to be confirmed before compilation/use. It is not a photodiode measurement program. A real implementation would need to account for ADC wiring and the tight flash/RAM constraints of ATtiny13A; do not claim this sample fits or works without testing against the selected Arduino core and board settings.

## Acceptance criteria

- Documentation never describes the reconstructed sketch as the lost original.
- The firmware chapter contains the actual known development history and distinguishes verified facts from missing details.
- If original firmware is found, the docs reflect the real source rather than this example.
- No PCB, wiring, fuse, or pin assumptions are silently made.
- Do not expand scope into redesigning the electronics or calibrating optical experiments. The owner is closing the project.
