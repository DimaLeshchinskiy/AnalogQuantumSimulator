# Six reproducible demonstrations

[Project](../README.md) · [Theory and conventions](01-theory.md) · [Limitations](05-limitations-and-lessons.md)

## Common setup

Each chain runs from left to right, with laser before the LP and PBS after the listed plates. Operator products act rightmost first. Angles refer to a **calibrated H/V optical reference**, not a printed zero. H denotes a Hadamard gate in equations, while $|H\rangle=|0\rangle$ denotes horizontal input.

Use the existing laser, appropriate foil cassettes, PBS and beam stops. First identify the H and V spots with the LP and retain those labels throughout. Change one configuration at a time and record cassette identity, order and nominal orientation. No photodiode electronics or reference firmware is required.

**Safety:** never look into the beam or specular reflections; use suitable beam stops and laser safety practices. The installed laser specifications are unverified.

All “Observed” statements below are from the builder's account. There is no calibrated intensity dataset, and current photo placeholders are not evidence. Ideal percentages describe predictions only.

## 1. Preparation and PBS analysis

**Purpose and components:** establish the basis and output-channel labels using the laser, one LP and PBS.

**Procedure:** use `LP(H) → PBS`; then rotate the LP by 90° to use `LP(V) → PBS`. Identify which spot brightens in each case.

**Ideal prediction:** the prepared vectors $(1,0)^T$ and $(0,1)^T$ give $P_H/P_V=100/0$ and $0/100$ respectively. The LP selects a polarization and reduces transmitted power.

**Observed:** the builder used LP/PBS analysis to establish the reference and compare visible spots; no numerical extinction ratio was recorded.

**Discrepancies and interpretation:** incomplete LP extinction, PBS leakage, axis error or scattering can leave a weak second spot. This establishes an operational reference, not a full polarimeter calibration.

> **Photos pending:** `exp-01-h.jpg` and `exp-01-v.jpg`, showing the LP setting and labeled PBS spots.

## 2. Hadamard analog

**Purpose and components:** convert H input into diagonal polarization with an LP, one HWP and PBS.

**Procedure:** `LP(H) → HWP(22.5°) → PBS`.

**Ideal prediction:**

$$
H|H\rangle=\frac{|H\rangle+|V\rangle}{\sqrt2}=|+\rangle,
\qquad (P_H,P_V)=(1/2,1/2).
$$

**Observed:** the builder saw approximately equal spot brightness.

**Discrepancies and interpretation:** unequal outputs can result from axis offsets, retardance error or channel transmission differences. A 50/50 observation for one input is consistent with the intended action; it does not certify the entire Hadamard transformation or the relative phase.

> **Photo pending:** `exp-02-hadamard.jpg`, showing the nominal axis and both output spots.

## 3. Gate composition: two Hadamards

**Purpose and components:** test a sequence using an LP, two distinct HWPs and PBS.

**Procedure:** `LP(H) → HWP₁(22.5°) → HWP₂(22.5°) → PBS`.

**Ideal prediction:** $H^2=I$, as [multiplied explicitly in the theory chapter](01-theory.md#matrices-and-conventions), so $H^2|H\rangle=|H\rangle$ and the ratio is 100/0.

**Observed:** the output returned close to the original polarization.

**Discrepancies and interpretation:** separate plates may have different retardances and optical-zero offsets. Returning one input approximately to H supports this composition example, without proving identity on every possible input.

> **Photo pending:** `exp-03-h-squared.jpg`, showing both cassette settings and the restored bright channel.

## 4. NOT, double NOT and imperfections

**Purpose and components:** swap the basis states and compare repeated transformations using an LP, one or two HWPs and PBS.

**Procedure:** first use `LP(H) → HWP(45°) → PBS`. Then compare `LP(H) → HWP₁(+45°) → HWP₂(+45°) → PBS` with the second plate at −45°.

**Ideal prediction:** $X|H\rangle=|V\rangle$, giving 0/100. Two same-orientation ideal plates give $X^2=I$. Since $W_{1/2}(-45^\circ)=-X$, the crossed pair gives $(-X)X=-I$. Both pairs return H with ideal ratio 100/0; the global minus sign is invisible here.

**Observed:** a single NOT approximately swapped the bright output, with weak residual light in the other channel. The crossed +45°/−45° pair looked better than some same-orientation combinations.

**Discrepancies and interpretation:** axis and retardance errors compose differently. Equal-retardance plates with orthogonal axes can cancel a shared retardance error, but this apparatus was not characterized well enough to establish that explanation. The wider account of appearances near 100/0 through roughly 60/40 is qualitative, not a measured percentage for these configurations.

> **Photos pending:** `exp-04-not.jpg` and `exp-04-double-not.jpg`. State the actual second-plate orientation in the caption.

## 5. One-bit Deutsch–Jozsa using a phase oracle

**Purpose and components:** distinguish constant from balanced one-bit functions using an LP, two Hadamard HWPs, an optional third HWP as oracle, and PBS.

**Procedure:** `LP(H) → HWP(22.5°) → Oracle → HWP(22.5°) → PBS`. Leave the oracle position empty for identity; insert an HWP at 0° for Z.

A Boolean function $f:\{0,1\}\to\{0,1\}$ is constant when its two outputs agree and balanced when they differ. Its phase oracle is

$$
U_f|x\rangle=(-1)^{f(x)}|x\rangle.
$$

| f(0) | f(1) | Class | Phase oracle |
| --- | --- | --- | --- |
| 0 | 0 | Constant | I |
| 1 | 1 | Constant | −I |
| 0 | 1 | Balanced | Z |
| 1 | 0 | Balanced | −Z |

**Ideal prediction:**

$$
HU_fH|0\rangle=
\frac{(-1)^{f(0)}+(-1)^{f(1)}}{2}|0\rangle+
\frac{(-1)^{f(0)}-(-1)^{f(1)}}{2}|1\rangle.
$$

Equal function values cancel the V amplitude; different values cancel H. Equivalently $HIH=I$ and $HZH=X$: constant gives 100/0, balanced gives 0/100. Global oracle signs change neither result.

The ideal oracle model uses one query to decide the class; a deterministic classical bit-query procedure requires both values in the worst case. This apparatus physically sets a classical optical phase transformation and shows no quantum advantage. In the two-register bit-flip formulation, preparing the target as $|-\rangle$ makes the oracle factor out $(-1)^{f(x)}$ on the input. The optical experiment implements that reduced phase action, not an additional target register or general multi-qubit algorithm.

**Observed:** the builder saw the expected output swap between identity and Z oracle configurations, with imperfect extinction.

**Discrepancies and interpretation:** the three-HWP sequence combines plate errors, alignment and PBS leakage. It demonstrates the one-bit phase/interference principle qualitatively, with no measured success probability.

> **Photos pending:** `exp-05-dj-constant.jpg` and `exp-05-dj-balanced.jpg`, with oracle choice and output-channel labels.

## 6. QWP: phase hidden from H/V intensity

**Status: proposed experiment, not confirmed as performed.**

**Purpose and components:** compare states with equal H/V intensities but different relative phases using an LP, two HWPs, a QWP and PBS.

**Procedure:** compare:

- A: `LP(H) → HWP(22.5°) → PBS`.
- B: `LP(H) → HWP(22.5°) → QWP(0°) → PBS`.

Then add the second HWP at 22.5° immediately before the PBS in each chain. B now uses four cassettes—LP, HWP, QWP, HWP—so it fits both the saved four-holder assembly and the reported five-position apparatus.

**Ideal prediction:** A prepares $|+\rangle$; B prepares $|\psi_i\rangle=(|H\rangle+i|V\rangle)/\sqrt2$ with our $Q(0^\circ)=\operatorname{diag}(1,i)$ convention. Both initially give 50/50. After the added Hadamard analyzer, $H|+\rangle=|H\rangle$ gives 100/0, while

$$
H|\psi_i\rangle=\frac{(1+i)|H\rangle+(1-i)|V\rangle}{2}
$$

still gives 50/50. The analyzer changes the measurement basis and reveals information hidden from the initial H/V comparison.

**Observed:** no completed result is documented.

**Discrepancies and interpretation:** QWP retardance and axis error, wavelength mismatch and the two HWPs can alter these predictions. H/V equality alone does not prove circular polarization; this comparison also falls short of full state tomography.

> **Owner confirmation requested if performed:** photograph A and B before and after the analyzer, label every setting, and confirm the visible outcome. Use `exp-06-qwp-before-analysis.jpg` and `exp-06-qwp-after-analysis.jpg` as paired/composite views. Until then, retain the planned status.
