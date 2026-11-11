# Trying the gates, one cassette at a time

[Project](../README.md) · [The mathematics](01-theory.md) · [What I learned](05-limitations-and-lessons.md)

I began with the simplest question the apparatus could answer: could I prepare a polarization and recognize it at the outputs? From there I added one plate, then two, and eventually the phase-oracle sequence I had wanted to build.

For all of these experiments I power the laser from a **3 V power supply**. Before inserting foils, I orient the polarized laser until the laser and PBS alone give roughly equal spots. That is the starting adjustment that has worked best for me. The LP then prepares H or V; I do not use the bare laser's 50/50 split as a substitute for that preparation.

The chains below run from laser to PBS, omitting empty holders. I reference angles to the H/V optical axes established with the LP, rather than assuming a printed zero is exact. In equations, $H$ means Hadamard and $|H\rangle=|0\rangle$ means horizontal polarization. Rightmost operators act first.

I judged the results by the spots on paper. The ideal fractions come from the matrices; my approximate real ratios are visual estimates. I did not use the unfinished photodiode readout or calculate intensities from camera pixels.

## 1. Finding H and V

I first put only the LP in the beam:

`LP(H) → PBS`, then `LP(V) → PBS`.

Rotating it by 90° let me identify the two output channels. For ideal H input, $(1,0)^T$, all the output is H; for V, $(0,1)^T$, all is V. I therefore expected 100/0 and 0/100.

| LP set to H | LP set to V |
| --- | --- |
| ![My H preparation with a linear polarizer and the PBS output spots](../images/lp_h.jpg) | ![My V preparation after rotating the linear polarizer by 90 degrees](../images/lp_v.jpg) |

*The same setup with the LP rotated. I used this comparison to name the output channels.*

The bright output changed as expected. It gave me a reference for the rest of the experiments, although weak light in the other direction could still come from imperfect extinction, alignment or scattering. I did not measure an extinction ratio.

## 2. Putting in a Hadamard

Next I kept H preparation and inserted an HWP at 22.5°:

`LP(H) → HWP(22.5°) → PBS`.

The calculation was short enough to keep beside the apparatus:

$$
H|H\rangle=\frac1{\sqrt2}
\begin{pmatrix}1&1\\1&-1\end{pmatrix}
\begin{pmatrix}1\\0\end{pmatrix}
=\frac{|H\rangle+|V\rangle}{\sqrt2}.
$$

Both components have squared magnitude $1/2$, so I expected two equal spots. That is approximately what I saw.

![My Hadamard experiment with an LP and one HWP in the beam, producing two visible PBS spots](../images/hadamard.jpg)

*H preparation followed by the nominal 22.5° HWP.*

This was the first direct connection between a gate matrix and a visible change. It was also only one input tested in one basis: a 50/50 output by itself cannot establish the relative phase or certify the whole Hadamard transformation.

## 3. Adding a second Hadamard

I then inserted another HWP at the same nominal angle:

`LP(H) → HWP₁(22.5°) → HWP₂(22.5°) → PBS`.

Since $H^2=I$, the ideal result is H again, or 100/0. The output returned close to the original polarization.

![My two-Hadamard sequence with two HWP cassettes and a dominant PBS output spot](../images/double_hadamard.jpg)

*Two physical plates implementing the nominal $H^2$ sequence.*

The important difference from the calculation is that these are two separate foils. They need not have identical retardance or identical offsets between their optical axes and cassette marks. Returning approximately to H was useful evidence for the sequence, but not proof that it acted as identity on every possible input.

## 4. Swapping the output, then trying to swap it back

For NOT, I changed the HWP setting to 45°:

`LP(H) → HWP(45°) → PBS`.

Ideally $X|H\rangle=|V\rangle$, giving 0/100. I saw the bright output move to the other channel, with some residual light left behind.

I also tried two NOT plates:

`LP(H) → HWP₁(+45°) → HWP₂(+45° or −45°) → PBS`.

| One NOT | Double NOT |
| --- | --- |
| ![My single-NOT optical sequence with one HWP after the LP](../images/not.jpg) | ![My double-NOT sequence with two HWP cassettes after the LP](../images/double_not.jpg) |

*The single- and double-plate tests. The photograph records the cassette arrangement; its labels do not measure the true optical axes.*

For two ideal plates at +45°, $X^2=I$. A plate at −45° has $W_{1/2}(-45^\circ)=-X$, so the crossed pair gives $(-X)X=-I$. The global sign does not change the output intensities; both pairs should return to H.

In practice the crossed +45°/−45° combination looked better than some same-orientation combinations. This was one point where the real apparatus became more interesting than simply matching the expected bright spot. Two equal-retardance plates with orthogonal axes can cancel a shared retardance error, which is a possible explanation. I did not characterize the foils well enough to prove it. Across different states and sequences I saw results ranging from nearly one bright channel to appearances around 60/40.

## 5. Reaching the Deutsch–Jozsa experiment

This was the sequence I had wanted to reach from the start:

`LP(H) → HWP(22.5°) → Oracle → HWP(22.5°) → PBS`.

For a one-bit Boolean function, there are only four possibilities. If $f(0)=f(1)$ it is constant; otherwise it is balanced. I use the phase-oracle form,

$$
U_f|x\rangle=(-1)^{f(x)}|x\rangle.
$$

| f(0) | f(1) | Class | Phase oracle |
| --- | --- | --- | --- |
| 0 | 0 | Constant | I |
| 1 | 1 | Constant | −I |
| 0 | 1 | Balanced | Z |
| 1 | 0 | Balanced | −Z |

The signs multiplying the entire oracle are global phases, so I only need to compare identity and Z. I leave the oracle position empty for identity and insert an HWP at 0° for Z.

The first Hadamard makes a superposition, the oracle changes its phases, and the last Hadamard makes the difference visible:

$$
HU_fH|0\rangle=
\frac{(-1)^{f(0)}+(-1)^{f(1)}}{2}|0\rangle+
\frac{(-1)^{f(0)}-(-1)^{f(1)}}{2}|1\rangle.
$$

For a constant function, the V amplitude cancels and I expect 100/0. For a balanced function, H cancels and I expect 0/100. Equivalently, $HIH=I$ while $HZH=X$.

| Constant: identity oracle | Balanced: Z oracle |
| --- | --- |
| ![My constant-oracle experiment with an empty oracle position between the two Hadamard plates](../images/dj_constant_i.jpg) | ![My balanced-oracle experiment with an additional HWP implementing Z between the Hadamard plates](../images/dj_balanced_z.jpg) |

*The two oracle configurations. Inserting a phase plate changes which output is bright after the final Hadamard.*

I saw the expected qualitative output swap, although the unwanted channel was not completely dark. By then I was composing three real HWPs, so axis offsets, retardance errors and alignment all had opportunities to affect the contrast.

In the ideal oracle model, one query distinguishes the two classes; a deterministic classical bit-query procedure needs both function values in the worst case. My apparatus is a classical optical implementation of the phase transformation and does not demonstrate quantum advantage. In the usual two-register bit-flip version, a target prepared as $|-\rangle$ factors out the phase $(-1)^{f(x)}$ on the input. I implement that reduced phase action, without an extra physical target register.

## 6. Looking for the phase that H/V could not show

For the last comparison I used a QWP. I wanted two states that looked alike in H/V, then an analyzer that would tell them apart.

I photographed two chains before the final analyzer:

- A: `LP(H) → HWP(22.5°) → PBS`.
- B: `LP(H) → HWP(22.5°) → QWP(0°) → PBS`.

With my convention $Q(0^\circ)=\operatorname{diag}(1,i)$, A prepares $|+\rangle$ and B prepares

$$
|\psi_i\rangle=\frac{|H\rangle+i|V\rangle}{\sqrt2}.
$$

Both give ideal 50/50 H/V outputs. The PBS alone cannot reveal their relative-phase difference.

| A: without QWP | B: with QWP |
| --- | --- |
| ![My QWP comparison A before the final analyzer, with LP and HWP](../images/6_exp_a_before.jpg) | ![My QWP comparison B before the final analyzer, with LP, HWP and QWP](../images/6_exp_b_before.jpg) |

*Before the final analyzer: the ideal H/V intensities are the same for both states.*

I then put an HWP at 22.5° immediately before the PBS in each chain. In B the full sequence is LP, HWP, QWP, HWP, using four cassette positions.

The extra Hadamard changes the analysis basis:

$$
H|+\rangle=|H\rangle,\qquad
H|\psi_i\rangle=
\frac{(1+i)|H\rangle+(1-i)|V\rangle}{2}.
$$

I therefore expect A to become 100/0 while B remains 50/50.

| A after the analyzer | B after the analyzer |
| --- | --- |
| ![My comparison A with the final HWP analyzer added and one output visibly dominant](../images/6_exp_a_after.jpg) | ![My comparison B with QWP and final HWP analyzer inserted](../images/6_exp_b_after.jpg) |

*The completed comparison. By eye I estimated roughly 80/20 without QWP and 40/60 with QWP after the analyzer; the ideal model predicts 100/0 and 50/50.*

This gave me the distinction I was looking for: one case became clearly dominated by one output, while the other stayed much closer to an even split. The results were imperfect, and I did not measure those ratios with detectors. I also would not claim that two equal H/V spots alone prove circular polarization or that this comparison amounts to full state tomography.

It was a useful place to finish. The phase was invisible in one measurement basis and affected the output in another, with the same plates and paper targets I had started with.
