# From polarization to a qubit

[Project](../README.md) · [Next: optical components](02-optical-components.md)

## Two complex amplitudes

For a coherent, fully polarized monochromatic beam propagating along a fixed path, the transverse electric field has complex H and V amplitudes. Removing its overall intensity gives a normalized Jones vector:

$$
|\psi\rangle=
\begin{pmatrix}\alpha\\\beta\end{pmatrix}
=\alpha|H\rangle+\beta|V\rangle,
\qquad |\alpha|^2+|\beta|^2=1.
$$

We identify $|H\rangle=|0\rangle=(1,0)^T$ and $|V\rangle=|1\rangle=(0,1)^T$. The ket notation emphasizes the mathematical analogy. Here the amplitudes describe a classical field, not an individual photon.

An ideal H/V PBS separates the two components. If total output intensity is nonzero, its normalized outputs are

$$
P_H=\frac{I_H}{I_H+I_V}=|\alpha|^2,\qquad
P_V=\frac{I_V}{I_H+I_V}=|\beta|^2.
$$

These are classical intensity fractions, numerically analogous to Born probabilities. Real channels can have different transmission and detection efficiencies.

## Phase carries information

Multiplying both amplitudes by $e^{i\gamma}$ changes the global phase. It does not change polarization or these intensities in this single-path experiment. The phase between the amplitudes does matter:

$$
|+\rangle=\frac{|H\rangle+|V\rangle}{\sqrt2},\qquad
|-\rangle=\frac{|H\rangle-|V\rangle}{\sqrt2},\qquad
|\psi_i\rangle=\frac{|H\rangle+i|V\rangle}{\sqrt2}.
$$

The first two are orthogonal diagonal linear polarizations. The third has equal amplitudes in quadrature and is circular in the ideal model. More general amplitude/phase combinations describe elliptical polarization. All three states above give 50/50 in H/V, so the initial two spots cannot distinguish them.

Normalized pure polarization states, modulo global phase, form a Poincaré sphere corresponding mathematically to the qubit Bloch sphere. Coordinate signs and circular-polarization handedness depend on conventions. Partially polarized light needs a coherence-matrix description; a single normalized Jones vector does not represent it.

## Matrices and conventions

Angles are measured from calibrated H toward V in the transverse basis. Define

$$
R(\theta)=
\begin{pmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{pmatrix},
\qquad
J_\Delta(\theta)=R(\theta)
\begin{pmatrix}1&0\\0&e^{i\Delta}\end{pmatrix}
R(-\theta).
$$

This specifies our ideal retarder convention. For a half-wave plate, $\Delta=\pi$:

$$
W_{1/2}(\theta)=
\begin{pmatrix}
\cos(2\theta)&\sin(2\theta)\\
\sin(2\theta)&-\cos(2\theta)
\end{pmatrix}.
$$

Thus $W_{1/2}(0^\circ)=Z$, $W_{1/2}(22.5^\circ)=H$ and $W_{1/2}(45^\circ)=X$, where

$$
Z=\begin{pmatrix}1&0\\0&-1\end{pmatrix},\quad
H=\frac1{\sqrt2}\begin{pmatrix}1&1\\1&-1\end{pmatrix},\quad
X=\begin{pmatrix}0&1\\1&0\end{pmatrix}.
$$

Plain $H$ denotes the **Hadamard gate**; $|H\rangle$ denotes horizontal polarization. A real plate can add an intensity-irrelevant global phase.

The **rightmost operator acts first**: a beam traversing A then B has output $BA|\psi\rangle$. For example,

$$
H|H\rangle=\frac1{\sqrt2}\begin{pmatrix}1\\1\end{pmatrix}=|+\rangle.
$$

Composition follows directly:

$$
H^2=\frac12
\begin{pmatrix}1&1\\1&-1\end{pmatrix}
\begin{pmatrix}1&1\\1&-1\end{pmatrix}=I,
$$

$$
HZH=\frac12
\begin{pmatrix}1&1\\1&-1\end{pmatrix}
\begin{pmatrix}1&1\\-1&1\end{pmatrix}=X.
$$

## A phase revealed by another basis

Our quarter-wave convention is $Q(0^\circ)=J_{\pi/2}(0^\circ)=\operatorname{diag}(1,i)$, so $Q(0^\circ)|+\rangle=|\psi_i\rangle$. Fast/slow-axis labels and handedness conventions vary; these equations define the choice used here.

Adding a Hadamard before the PBS changes the measurement basis:

$$
H|+\rangle=|H\rangle,\qquad
H|\psi_i\rangle=
\frac{(1+i)|H\rangle+(1-i)|V\rangle}{2}.
$$

The outputs become 100/0 and 50/50 respectively because $|1\pm i|^2/4=1/2$. This is the ideal prediction for the proposed phase experiment, not a recorded measurement.

The analogy reproduces single-qubit linear algebra. It does not demonstrate photon-counting statistics, quantum state collapse, entanglement, many-qubit scaling or quantum speedup. The PBS routes classical field energy into two paths; looking at the spots is not a single-photon projective-measurement experiment.
