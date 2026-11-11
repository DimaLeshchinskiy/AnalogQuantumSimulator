# Limitations and lessons

[Project](../README.md) · [Experiments](04-experiments.md) · [Development history](03-hardware-and-development.md)

## What was achieved

The builder qualitatively demonstrated polarization preparation, Hadamard and X analogs, gate composition, and the one-bit Deutsch–Jozsa phase-oracle distinction. The apparatus made relative phase and matrix multiplication physically approachable. Printed cassettes and preserved design files provide a reusable educational record.

This coherent classical beam does not demonstrate single-photon statistics, entanglement, quantum measurement back-action or scalable quantum computation. Matching the amplitudes of a single qubit does not establish computational advantage.

## Optical error has several sources

Mechanical indexing, foil-axis offsets, nonideal retardance, wavelength mismatch, PBS extinction, scattering and beam alignment can all affect the outputs. Additional plates compose their errors; the result can depend on both the input state and the sequence even when every component acts linearly.

The ideal retarder model makes angle and retardance errors distinct. For H input, multiplying $J_\Delta(\theta)$ by $(1,0)^T$ gives vertical amplitude

$$
\beta=\sin\theta\cos\theta(1-e^{i\Delta}),
\qquad
P_V=\sin^2(2\theta)\sin^2(\Delta/2).
$$

For a perfect HWP near the X setting, $\theta=45^\circ+\delta$ and $\Delta=\pi$. The wrong H channel has

$$
P_{\mathrm{wrong}}=\sin^2(2\delta)\approx4\delta^2
$$

for small $\delta$ in radians. This estimate assumes an ideal H input, perfect retardance, ideal PBS and no other errors. It cannot diagnose the actual apparatus from visual leakage alone.

The builder's descriptions ranging from near 100/0 to approximately 60/40 are visual estimates, not a measured error distribution. Brightness perception is nonlinear; camera exposure, clipping and channel geometry also prevent photographs from serving as calibrated intensity data. No numerical gate fidelity is established.

## Why crossed plates might help

Ideal HWPs at +45° and −45° differ by a global sign; their pair yields identity up to phase. More generally, using our retarder convention, two plates with equal retardance and truly orthogonal axes satisfy

$$
J_\Delta(\theta+90^\circ)J_\Delta(\theta)=e^{i\Delta}I.
$$

That cancellation can persist with a shared retardance error. The reported better return from crossed plates is consistent with this mechanism, but the plates' axes and retardances were not measured. It remains a possible explanation, not a demonstrated diagnosis or evidence of optical nonlinearity.

## Electronics quantify; they do not repair the optics

Detector calibration concerns dark offsets, relative channel gain, linear response and saturation. Optical calibration concerns axes, retardance, wavelength, PBS leakage and alignment. Correcting detector bias can improve an intensity estimate; it cannot turn a genuine 60/40 optical output into 100/0.

The controller and LEDs were reportedly validated after an assembly correction. Photodiode integration and calibration remained unfinished, and the original firmware was not recovered. These facts neither establish analog-readout performance nor show that the PCB was fundamentally defective.

The project closed deliberately after its teaching objective was met. The QWP experiment remains proposed; photos and installed-component identification can complete the record without restarting development. Detector integration, Stokes measurements or tomography are optional work outside this scope.
