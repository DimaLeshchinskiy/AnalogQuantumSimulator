# Codex task: Complete documentation for a DIY polarization-based single-qubit optical simulator

> **Use this entire file as the task brief.** The project owner will add photographs later. The objective is to close and document an already-built educational project, **not** to restart development or add features.

## 0. Your mission

You are Codex, working in the root of the existing project repository. Inspect the actual repository before making changes. Produce a polished, scientifically accurate, English-language GitHub documentation set for a **classical polarization-optics analog of single-qubit quantum gates**, including a candid engineering development story and reproducible experiments. The user has completed the educational goal and wants a durable, attractive record of what was built and learned.

**Important editorial stance:** This is neither a universal quantum computer nor a single-photon quantum experiment. It is a coherent classical optical system whose Jones-vector formalism is isomorphic to the two-dimensional mathematics of a single qubit, up to physically relevant limitations. Do not call the apparatus a quantum computer without qualification. Do not claim entanglement, quantum advantage, photon counting, or a genuinely quantum measurement. Use *polarization-based quantum-gate analog*, *single-qubit optical simulator*, or *classical optical analog*.

**Do not** modify firmware, CAD, PCB, electronic schematics, or hardware design to complete this task. Do not introduce new hardware requirements. Only author docs, image placeholders, and optional documentation navigation. The owner will add actual photos later. Do not generate fake photographs, fake numerical measurements, fabricated dates, or unverified specifications.

## 1. Deliverables and repository layout

Adapt to existing directories rather than duplicating established files. Prefer:

```text
README.md
 docs/
   01-theory.md
   02-optical-components.md
   03-hardware-and-development.md
   04-experiments.md
   05-limitations-and-lessons.md
 images/
   README.md                 # photo shot list and naming guide
 hardware/                   # preserve existing CAD, PCB and schematic assets
 firmware/                   # preserve existing source
```

If the repo already has a better layout, preserve it and adjust links. Keep `README.md` concise, with a hero-photo placeholder, a clear scientific disclaimer, a feature summary, a simple optical-chain diagram, a six-experiment table, a brief engineering summary, and links to chapters. Chapters should be substantial enough to teach but avoid repetitive textbook filler. Aim for approximately 2,500–5,000 words total across documentation, adjusted to available repository evidence; more only if justified by real engineering details.

GitHub Markdown supports math: inline `$...$`, display `$$...$$`, matrices with `\\begin{pmatrix}...\\end{pmatrix}`. Ensure formulas render correctly in GitHub. Use relative links and meaningful image alt text. Do not create broken `<img>` tags pointing to missing photos: use clearly labeled placeholders or a photo checklist until files are present. Use Mermaid only where it adds clarity and is supported by GitHub; simple Markdown or text diagrams are fine.

## 2. Project history: context from discussions with the builder

The following is **project-owner recollection and discussion history**, not a substitute for repository verification. Preserve it faithfully and distinguish confirmed implementation from earlier ideas and inferred explanations. If repo files contradict any details, trust inspected source artifacts for technical facts and explicitly note the discrepancy rather than silently rewriting history.

### 2.1 Motivation and early concept (around August 2026)

The builder is studying quantum informatics at CTU FIT. The original motivation was to make abstract quantum-gate mathematics tangible: physically prepare a polarization state, apply optical elements corresponding to gates, and see the result after polarization analysis. The target was an educational, portable, single-qubit demonstration, particularly **the one-input Deutsch–Jozsa algorithm**, rather than a scalable quantum processor or a research-grade polarimeter. Early concepts contemplated a minimal, largely passive optical arrangement without electronic readout, possibly with two oracle configurations and paper targets. Later, the project evolved into a reusable, modular optical apparatus with removable optical elements and custom electronics. Present these as evolving design options, not contradictory claims.

The intended conceptual pipeline was:

`prepare input → optical gate(s) → optional oracle → interference/analysis → polarization measurement`

A useful intellectual theme: translating Dirac notation and 2×2 matrices into Jones vectors and physical optical transformations; demonstrating that phase matters even when direct H/V intensity measurements look identical.

### 2.2 Optical architecture and mechanics

The built optical system uses a laser, a linear polarizer (LP), half-wave plates (HWP), quarter-wave plates (QWP), a polarizing beam splitter (PBS), and visible output spots. It has **five slots/positions for swappable optical cassettes**. Optical foils are mounted in 3D-printed removable holders; each cassette can be rotated in discrete **22.5° increments**. Cassettes are mechanically compatible and holders can be shared/reused. The builder modeled the mechanical components in CAD, printed parts, and ordered small mechanical components (nuts, screws, etc.).

The final prepared set discussed with the builder comprises **seven labeled optical cassettes: three HWP, two QWP, and two LP**. Confirm from repo or owner photos before presenting this as a bill of materials; if uncertain say “reported configuration.” These counts enable an LP input, multiple sequential wave-plate gates, and a phase experiment. There is no need to fill all slots in every experiment.

A PBS separates H and V components into distinct paths/spots; initially, the builder evaluated the brightness visually. Laser wavelength/power and exact commercial foil models must be taken from existing BOM, purchase records, schematics, or verified project files. Earlier discussions mention a possible **532 nm, 1 mW** laser order; this is **not sufficient to assert the installed laser is that model**. Avoid definitive wavelength claims until verified. Wave-plate retardance is wavelength-dependent, which may matter for observed gate errors.

### 2.3 Electronics: design, implementation, and why it was not used in the final demonstrations

A custom PCB was designed and assembled. Discussion history identifies:

- **ATtiny13A** microcontroller;
- **TS912** operational amplifier (verify exact variant, channels, and wiring from schematic);
- **two BPW34 photodiodes** intended for the two PBS output paths;
- **two LEDs** as visible indicators;
- a button and firmware with **four operating states/modes**, including PWM behavior (verify exact behavior from source before describing each mode);
- programming using an **Arduino Nano as ISP**.

The owner successfully programmed the ATtiny13A and verified that the button, mode switching, and PWM/LED control worked. There was an assembly/debugging issue with LED polarity; after correcting LED orientation, the indicators worked. This is a legitimate engineering troubleshooting anecdote, but check source or ask before attributing detailed electrical causes.

The two photodiodes were intended to detect light in the PBS outputs and provide an electronic readout. **At the last documented stage, the photodiodes had not yet been wired/soldered into the complete optical measurement setup.** Consequently, no verified photodiode intensity dataset exists. The board/firmware may work while the *full electro-optical measurement chain* remains unfinished. Describe these separately.

The owner chose not to finish/calibrate the readout for the final optical demonstrations because the primary educational objective was already met using the visible PBS spots. Electronics would provide more objective measurements, but **would not fix state-dependent optical errors** or make an imperfect wave plate ideal. The decision was one of scope and diminishing returns, **not proof that the PCB was fundamentally defective**. Avoid saying the electronics were “useless” or “failed.” Phrase it as *designed and partially validated, not integrated into the final demo*. Be honest that the electronics cost engineering effort and remained an unfinished subsystem.

An important distinction for documentation:

- **Detector calibration** (dark offsets, relative gain, linear response, saturation) can correct detector-channel biases.
- **Optical calibration** (actual wave-plate axis, retardance, alignment, wavelength, PBS extinction, mechanical offsets) is a separate issue.
- A single detector gain correction cannot transform a genuine 60/40 optical output into an ideal 100/0 result without falsifying the experiment.

Only mention specific ADC wiring, amplification topology, photodiode bias, power rails, pin numbers, PCB revisions, or component values if verified in actual files.

### 2.4 Observed experiments and optical behavior

The builder personally observed the following, initially by comparing the PBS output spots **visually**, not with calibrated photodiodes:

1. **Input preparation and H/V analysis:** LP and PBS establish a reference for horizontal and vertical polarization.
2. **Hadamard analog:** an HWP nominally at **22.5°** relative to the calibrated H/V reference produces approximately equal H and V output intensities from H input. This is consistent with the ideal Hadamard action in a chosen Jones convention; a 50/50 split alone does not certify the full unitary transformation.
3. **Two Hadamards:** two nominally 22.5° HWP elements in sequence returned the output close to the original polarization, consistent with `H² = I`.
4. **NOT / X analog:** an HWP nominally at **45°** approximately swaps H and V. Residual weak light remained in the nominally extinguished channel; it was not perfectly 100/0.
5. **Deutsch–Jozsa, one-input / phase-oracle form:** an HWP at 22.5°, then a nominal **Z** oracle (HWP at 0°), then an HWP at 22.5° produced a different PBS output than the constant oracle (no Z / identity). The builder observed the expected output swap qualitatively, though extinction was imperfect. Avoid describing this as a general multi-qubit Deutsch–Jozsa implementation or the standard two-register bit-flip oracle unless explicitly explaining the equivalence to a phase oracle.
6. **Sequential NOT gates:** two HWP elements at +45° and −45° relative to the same reference gave a better return to the input than some same-orientation combinations. This observation is consistent with **possible compensation of retardance errors** for crossed optical axes, but the underlying cause was **not measured or conclusively established**. Do not present it as a proven explanation.
7. **State- and sequence-dependent errors:** some configurations appeared close to 100/0, others approximately 60/40; results could differ depending on input polarization and on how many plates were composed. These were qualitative visual estimates unless new measurements exist. This does **not** by itself demonstrate optical nonlinearity: even linear Jones transformations can yield input-dependent output probabilities and interference of errors.

A **QWP phase experiment was planned for the final documentation**, but there is no confirmed observation that it was completed. Clearly label it **proposed / to be photographed and verified** until the owner supplies evidence. It is fine to include theory and expected outcomes, but never write them as measured results.

### 2.5 End-of-project decision

The owner concluded that the original goal—demonstrating basic polarization-based single-qubit gates and the Deutsch–Jozsa principle—was achieved. Rather than extend an increasingly time-consuming project with calibration, revised mechanics, or new PCB work, the final deliverable is a compact educational GitHub repository: photos, clear theory, the real engineering story, a small set of experiments, and honest limitations. This is a deliberate **scope closure**. Do not pressure the owner to add photodiodes, extra gates, motorization, or research-grade calibration.

Do not include private family conversations, personal frustrations, or other unrelated personal context in public project documentation.

## 3. Scientific foundations: accuracy requirements

Explain that the Jones vector of a coherent polarization state in H/V basis can be normalized and written analogously to a qubit:

$$
|\psi\rangle=\alpha|H\rangle+\beta|V\rangle,\qquad |\alpha|^2+|\beta|^2=1.
$$

For a PBS analyzing H/V, normalized ideal intensities are `P_H=|α|²` and `P_V=|β|²`. These are **classical normalized optical intensities** in this setup; they are numerically analogous to qubit Born probabilities, not experimentally observed single-photon outcomes.

Use a declared convention for the ideal HWP Jones matrix (up to irrelevant global phase):

$$
W_{1/2}(\theta)=
\begin{pmatrix}
\cos(2\theta)&\sin(2\theta)\\
\sin(2\theta)&-\cos(2\theta)
\end{pmatrix}.
$$

Then:

$$
W_{1/2}(0^\circ)=Z,\quad
W_{1/2}(22.5^\circ)=H,\quad
W_{1/2}(45^\circ)=X.
$$

Here `H` on the right denotes the **Hadamard gate**, not the horizontal basis state `|H⟩`; keep naming unambiguous.

For sequential plates, specify **rightmost operator acts first**. Show `H²=I` and `HZH=X` algebraically. When writing Deutsch–Jozsa, explain the one-bit Boolean function classes, phase-oracle action `U_f|x⟩=(-1)^{f(x)}|x⟩`, constant functions corresponding to `±I`, balanced functions to `±Z`, and that global signs do not affect intensity readout. Explain the algorithmic difference between constant and balanced in one query in the ideal mathematical model, and carefully distinguish this from classical polarization simulation and quantum computational advantage.

For QWP, select a clearly stated Jones convention. A convenient one is `Q(0°)=diag(1,i)` up to global phase, but fast/slow axis and handedness conventions vary. State the convention and ensure all later formulas match it. A properly oriented QWP on `|+⟩=(|H⟩+|V⟩)/√2` produces `( |H⟩+i|V⟩ )/√2` under that convention. Both states give 50/50 in H/V, but after a Hadamard analyzer the first gives deterministic H while the second still gives 50/50. Explain that the second HWP **changes the measurement basis**. Do not claim the initial H/V spots alone prove circular polarization.

One nuance: **+45° and −45° HWP are equivalent up to global phase for an ideal half-wave plate**. If actual plates have equal retardance and truly orthogonal optical axes, the pair may cancel even with a common retardance error. However, real cassette markings and axes may not be calibrated. Avoid asserting this compensation was definitively identified. Also avoid claiming `W(0°)W(45°)=±I`—that is generally false.

Discuss errors without overclaiming: angular offsets; nonideal retardance and laser wavelength; finite PBS extinction; alignment and scattering; multiple-plate composition; qualitative limits of human brightness perception. If useful, derive `P_wrong≈sin²(2δ)` for a *perfect HWP* near the ideal X setting with an angular offset δ; explain its limited assumptions. For general retardance Δ with H input, one possible convention gives `P_V=sin²(2θ)sin²(Δ/2)`. Do not conflate angle error with retardance error.

## 4. Detailed chapter outline

### README.md — front page

- Title, one-sentence purpose, hero-photo placeholder.
- **Prominent, short disclaimer** that this is a classical coherent-polarization analog, not a quantum computer.
- Why the builder made it: bridge quantum-information mathematics and a physical experiment.
- What is actually implemented: laser, LP, removable HWP/QWP foils, PBS, 3D-printed mechanics, optional custom PCB; five positions, 22.5° angular increments if verified.
- Simple block diagram of `laser → state preparation → gates/oracle → PBS → spots`.
- Small experiment table with expected ideal results and status (observed / planned).
- A paragraph on the PCB being built but not integrated into final optical readout.
- Table of contents linking the five docs chapters; how to reproduce; safety note: **never look into the beam or specular reflections; use suitable beam stops and laser safety practices**.
- No claims of measured fidelity, efficiency, or error rate without calibrated data.

### docs/01-theory.md — From polarization to a qubit

1. Polarization and complex electric-field amplitudes.
2. Jones vectors in H/V basis; normalization and global vs relative phase.
3. Classical intensities and the mathematical analogy to the Born rule.
4. Linear diagonal, circular, elliptical polarization; phase and Poincaré/Bloch sphere analogy.
5. Jones matrices, basis conventions, multiplication order.
6. What this analogy does *not* simulate (single-photon statistics, entanglement, measurement back-action, scalable quantum speedup).
7. A short worked example for `|H⟩ → H → |+⟩`.

### docs/02-optical-components.md — Optical hardware as gates

1. Laser and input LP (preparation; losses from polarizer).
2. HWP: angle-dependent rotation; X, Z, H and examples.
3. QWP: phase delay, circular/elliptical states, phase gate analogy.
4. PBS: H/V measurement and why a second plate can change the analyzed basis.
5. Optical axes vs mechanical marks; 22.5° discrete steps; limitations of alignment.
6. Annotated optical chain and component photographs as placeholders.
7. Short component/quantity table, clearly distinguishing observed setup from unverified specifications.

### docs/03-hardware-and-development.md — The engineering story (PRIORITY CHAPTER)

Write a **real development narrative**, not a sterile parts list. Cover:

1. Initial educational goal and why polarization optics were chosen instead of building a true quantum machine.
2. Early minimal passive concept and later decision to make a reusable, portable modular platform.
3. Requirements/trade-offs: easy swapping of gates; reproducible rotations; five optical slots; 22.5° increments; limited budget/time; visible PBS outputs; small physical footprint. If no formal requirements document exists, label these as retrospective design priorities.
4. CAD and 3D printing: modular cassettes, compatible holders, mechanical alignment, assembly. Include placeholders for CAD screenshots, exploded views, and printed parts.
5. Optical procurement and assembly: LP/HWP/QWP/PBS/laser; explain why foil wave plates were selected if evidence exists, otherwise describe them neutrally without inventing a procurement rationale.
6. Electronics design: why a detector/LED PCB seemed valuable; ATtiny13A, TS912, BPW34 pair, LEDs and button; block diagram only where actual schematic supports it; image placeholder for schematic and PCB.
7. Firmware/programming: Arduino Nano ISP workflow, ATtiny13A programming, four modes and PWM **only to the extent confirmed by code**, button/LED verification, LED polarity debugging. Never invent mode names or GPIO assignments.
8. Integration gap: photodiodes not fully connected at final demo; visible spots were sufficient to demonstrate the desired gate logic; electronics would quantify but not correct optical behavior.
9. Iterative experiments: H and X worked qualitatively, compound gates revealed varying extinction and possible error compensation.
10. Final scope decision: project closed as a successful optical demonstrator with an intentionally unfinished electronic-readout subsystem; future extensions only as optional ideas, not commitments.
11. An explicit **Decision log** table: decision, alternatives, motivation, consequence, confidence/evidence. Example decisions: classical polarization analog; modular removable foils; discrete rotation; initial electronic readout; visual demonstration as final path; stop after educational goal. Where reasons were not recorded, mark *rationale inferred* or leave open rather than invent.
12. Engineering lessons learned: calibrating mechanical angle vs optical axis, sequence-dependent optical errors, modularity, scope control, limits of visual measurement, validating PCB independently from optics.

Suggested narrative tone: factual first-person plural or neutral third-person; no marketing language and no invented dramatic setbacks. The author may use “I” only if consistent throughout and if writing from the builder's perspective; otherwise prefer neutral narrative.

### docs/04-experiments.md — Six reproducible demonstrations

For EACH experiment provide: purpose, required components, ordered optical configuration, ideal mathematical derivation, expected PBS output, actual observation **if documented**, photo placeholder, likely sources of discrepancy, and a concise interpretation. Use a consistent template. Reference all angles relative to a *calibrated H/V axis*, not an unverified printed zero mark. Use separate labels **Ideal prediction** and **Observed**.

**Experiment 1 — Preparation and PBS measurement**
- `Laser → LP (H, then V) → PBS`.
- Show H/V selection, corresponding output spots, and PBS as a polarization analyzer.
- Expected ideal H/V ratios 100/0 and 0/100, with real extinction limitations.

**Experiment 2 — Hadamard analog**
- `LP(H) → HWP(22.5°) → PBS`.
- `H|0⟩=|+⟩`, ideal 50/50; visually approximately equal output spots were observed.
- Explain why a single 50/50 observation does not certify a complete Hadamard transformation.

**Experiment 3 — Gate composition: H² = I**
- `LP(H) → HWP(22.5°) → HWP(22.5°) → PBS`.
- Expected return to H; qualitatively observed.
- Note two different physical plates may have different axis offsets/retardance.

**Experiment 4 — NOT, double NOT and imperfections**
- First `LP(H) → HWP(45°) → PBS`, expected X swap, weak leakage observed.
- Then `LP(H) → HWP₁(+45°) → HWP₂(+45° or −45°) → PBS`.
- Both same-axis and crossed-axis ideal HWP pairs yield identity up to global phase, but different real errors may appear. Builder reports crossed +45°/−45° combination looked better. Mark cause as hypothesis, not established fact.
- Avoid fabricated percentages; the owner reported some setups broadly ranging from near 100/0 to approximately 60/40.

**Experiment 5 — One-bit Deutsch–Jozsa using a phase oracle**
- `LP(H) → HWP(22.5°) → Oracle → HWP(22.5°) → PBS`.
- Constant `I` (or `−I` up to global phase) vs balanced `Z` (or `−Z`).
- `H I H|0⟩=|0⟩`; `H Z H|0⟩=|1⟩`.
- Both cases observed qualitatively with imperfect contrast.
- Explain the difference from the standard two-register formulation and why it is a valid phase-oracle reduction.

**Experiment 6 — QWP: phase hidden from H/V intensity**
- **PLANNED, not yet confirmed experimentally.**
- A: `LP(H) → HWP(22.5°) → PBS` gives `|+⟩`, ideal 50/50.
- B: `LP(H) → HWP(22.5°) → QWP(0°) → PBS` gives `( |H⟩+i|V⟩ )/√2` in the chosen QWP convention, ideal 50/50.
- Add HWP(22.5°) as analyzer before PBS to both chains: A ideal 100/0; B ideal 50/50.
- Explain relative phase and why changing measurement basis reveals a difference. This uses four optical elements before PBS (LP, HWP, QWP, HWP) and fits the five-slot system.
- Explicitly ask owner to photograph and confirm result; if not performed, keep this as *proposed experiment*.

Optionally include a compact experiment summary table with columns: experiment, configuration, ideal output, actual evidence, status. Avoid inventing photodiode data or numerical gate fidelity.

### docs/05-limitations-and-lessons.md — What the apparatus can and cannot show

- Classical coherent polarization vs true quantum single photons.
- No entanglement or many-qubit scaling; no genuine quantum speedup.
- Optical accuracy: mechanical step size, unknown optical axis offsets, wavelength-dependent retardance, PBS leakage, alignment, scattering.
- State-dependent/sequence-dependent errors are not evidence of nonlinear optical behavior.
- Visual spot brightness is qualitative, not calibrated intensity measurement; human vision is nonlinear.
- Why a custom PCB was not required to meet the original educational goal; electronics could quantify, not repair, errors.
- The +45°/−45° two-plate observation as a hypothesis-generating example, not a measured proof.
- Clear summary of what was achieved and what remained incomplete.
- Optional extensions (detector integration, Stokes parameter measurements/tomography, calibration) **briefly**, explicitly outside current project scope.

### images/README.md — Photography checklist

Give a numbered list of filenames and exact shots to capture:

- `hero-overview.jpg`: assembled apparatus, angled view.
- `optical-chain-labeled.jpg`: full laser-to-PBS chain with visible element positions.
- `cassette-detail.jpg`: removable LP/HWP/QWP cassettes and rotation mechanism.
- `cad-design.png`: CAD overview or exploded assembly.
- `pcb-front.jpg`, `pcb-back.jpg`, `pcb-schematic.png`: custom board and schematic.
- `firmware-programming.jpg`: Arduino Nano ISP setup, if a real photo exists.
- `exp-01-h.jpg`, `exp-01-v.jpg`.
- `exp-02-hadamard.jpg`.
- `exp-03-h-squared.jpg`.
- `exp-04-not.jpg`, `exp-04-double-not.jpg`.
- `exp-05-dj-constant.jpg`, `exp-05-dj-balanced.jpg`.
- `exp-06-qwp-before-analysis.jpg`, `exp-06-qwp-after-analysis.jpg` (only if performed).

Each photo should have an explicit caption specifying optical configuration and whether it shows the setup, PBS output spots, or both. Avoid suggesting that exposure-normalized camera photos are calibrated photometric data. Keep laser safety in mind when taking photos.

## 5. Repository inspection workflow (mandatory)

Before writing:

1. List relevant repo files; identify README, schematics, BOM, PCB files, CAD/3D print files, firmware, source comments, diagrams, notes, and existing photos.
2. Read firmware to confirm MCU, pins, button behavior, PWM and actual number of modes; **do not invent details** from the history summary.
3. Inspect schematic/BOM to verify TS912/BPW34 connections, LED arrangement, supply and amplifier topology; if files are binary or inaccessible, state that and describe only high-level confirmed history.
4. Inspect CAD/assets to verify slot count, rotation increments, cassette naming and optical chain; do not infer precise dimensions or material specifications from filenames alone.
5. Make a small private/internal **evidence matrix** mapping important claims to source file, discussion history, or `NEEDS_CONFIRMATION`. You may put outstanding questions in `docs/verification-notes.md` if helpful, but avoid cluttering public docs with dozens of TODOs.
6. Create docs and relative links. Avoid modifying hardware or firmware.
7. Verify GitHub math syntax and all relative links. Ensure every image reference is a placeholder until the file actually exists.
8. At completion, report exactly which files were created/changed, what facts were verified from repository, what remains based only on owner recollection, and a short list of photos/measurements needed.

If repository evidence is sparse, **still produce useful documentation** using the owner history above, but qualify unverified details and avoid imaginary specifics. Do not stop just because some images or electronic files are missing.

## 6. Style and quality bar

- Language: **English**, accessible to technically literate undergraduates; mathematically precise, not excessively formal.
- Audience: quantum-informatics students, engineers, hobbyists interested in optics, potential collaborators.
- Tone: grounded, educational, reflective; no exaggerated “revolutionary quantum computer” claims.
- Equations: derive the central claims instead of merely displaying matrices; use consistent notation throughout.
- Each experiment: clearly separate **ideal prediction**, **observed result**, and **possible explanation**.
- Development chapter: give the PCB, firmware and debugging a meaningful narrative even though the electronic readout was not deployed.
- The owner wants to **finish the project**, not receive a roadmap that requires more weeks of work. Make documentation publishable with photos added later.
- Do not attribute emotional or family motivations to the project.
- No fake source citations or vendor specifications; if referencing external technical facts, use reliable sources only when actually consulted and cite them accurately.

## 7. Final acceptance checklist

- [ ] GitHub README works as a clear project landing page.
- [ ] Five linked chapters exist, with a strong engineering-history chapter.
- [ ] All six experiments are documented; QWP correctly marked planned unless verified.
- [ ] `H²=I`, `HZH=X`, and QWP phase demonstration are mathematically consistent.
- [ ] Correctly distinguishes classical Jones optics from actual quantum hardware.
- [ ] Electronics history includes PCB, ATtiny13A, TS912, BPW34, LEDs, Arduino Nano ISP, LED-polarity debugging, firmware verification, and decision not to integrate photodiode readout; unverified implementation details are flagged.
- [ ] No invented measured percentages, calibration constants, datasheet claims, or hardware dimensions.
- [ ] No broken photo links; a clear shot list exists.
- [ ] No changes to working code, PCB, or CAD.
- [ ] Documentation is a satisfying **final artifact**, not a proposal for additional development.

**Proceed now:** inspect the repo, write the documentation, check equations and links, and summarize the results and remaining photo placeholders.
