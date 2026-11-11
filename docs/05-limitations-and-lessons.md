# What the imperfect results taught me

[Project](../README.md) · [The photographed experiments](04-experiments.md) · [Building the apparatus](03-hardware-and-development.md)

The setup did what I wanted in the sense that mattered to this project: I could prepare a polarization, apply gates, compose them, and see the distinction between two phase oracles. It also made the distance between an ideal matrix and a real component quite visible.

Some combinations left almost all the visible light in one channel. Others looked closer to 60/40. In the QWP comparison, I estimated about 80/20 without the QWP after the analyzer, and about 40/60 with it. Those are visual estimates. The photographs record the experiment, but exposure and saturated spots do not give me calibrated intensity ratios or gate fidelity.

The LP(V), single-NOT and Deutsch–Jozsa photographs also show diffuse light around the compact output dots. For visual comparisons I focus on the dots and treat the broad glow as an imperfection. That does not make the extra light disappear from a quantitative power measurement, and a separate faint dot still counts as leakage. I have not isolated the halo's cause; the photographs alone do not establish dispersion. A quantitative comparison would need consistent light-collection areas and background treatment.

## A plate can be wrong in more than one way

At first it is tempting to explain a weak second spot just by saying the angle is wrong. Angle is one possibility, but retardance is another. Starting with H and using the retarder convention from the theory chapter gives

$$
\beta=\sin\theta\cos\theta(1-e^{i\Delta}),\qquad
P_V=\sin^2(2\theta)\sin^2(\Delta/2).
$$

This separates the plate angle $\theta$ from its retardance $\Delta$. For a perfect HWP near the X setting, $\theta=45^\circ+\delta$ and $\Delta=\pi$, the unwanted H fraction is

$$
P_{\mathrm{wrong}}=\sin^2(2\delta)\approx4\delta^2
$$

for small $\delta$ in radians. That is a useful model, but it assumes ideal preparation, ideal retardance and an ideal PBS. I cannot work backward from a photograph and identify the actual cause using that formula alone.

My holders step in 22.5° increments. They do not remove offsets between the foil axis and the mechanical mark. Wavelength-dependent retardance, finite PBS extinction, alignment and scattering add other possibilities. When several plates are composed, their errors can combine differently for different input states. That does not require nonlinear optics.

## The crossed NOT pair

One result I found interesting was that +45° and −45° plates together gave a better return than some same-orientation combinations. For ideal HWPs the two orientations differ only by a global sign, so both pairs should return the polarization.

There is also a possible explanation for a difference with imperfect plates. If two plates have equal retardance and truly orthogonal axes, then

$$
J_\Delta(\theta+90^\circ)J_\Delta(\theta)=e^{i\Delta}I.
$$

Their shared retardance error can cancel. My observation is consistent with that, but I did not measure the two retardances or establish their exact axes. I keep it as an explanation worth considering, rather than a diagnosis I proved.

## Why I stopped with the spots

Finishing the detector board would have made comparisons more objective. Dark offsets, relative channel gain, linearity and saturation all belong to detector calibration. Foil axes, retardance, wavelength and PBS leakage belong to optical calibration. Correcting the detector cannot turn a real 60/40 optical output into 100/0.

I had tested the controller, button and LEDs, but I had not completed the photodiode measurement chain. I decided that finishing and calibrating it was beyond what I needed for the original educational goal. The visible results already let me follow the gate algebra and the one-bit Deutsch–Jozsa principle.

I also keep the boundary of the analogy clear. My laser carries a classical field; I did not demonstrate single-photon measurement, entanglement, quantum back-action or computational advantage. What I gained was a physical way to think through a two-dimensional state and its transformations, including the imperfections that disappear on paper.

The CAD, electronics files, photographs and this account are where I am closing the project. Detector integration or polarization tomography could be separate experiments later. They are not prerequisites for understanding what I built here.

---

**Continue:** [Circuit details (technical appendix)](electronics-reference.md) · [Back to the project](../README.md)
