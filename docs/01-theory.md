# The mathematics I wanted to see

[Project](../README.md) · [Next: putting the optics together](02-optical-components.md)

The connection that made this project possible was simple: the polarization of a coherent beam has two complex amplitudes. I could write them in a column, just as I would write the state of a qubit. That did not turn the laser into quantum hardware, but it gave me a physical system on which I could try the same calculations.

I take horizontal and vertical polarization as my basis, $|H\rangle=(1,0)^T$ and $|V\rangle=(0,1)^T$. After separating out the overall intensity, the Jones vector is

$$
|\psi\rangle=
\begin{pmatrix}\alpha\\\beta\end{pmatrix}
=\alpha|H\rangle+\beta|V\rangle,
\qquad |\alpha|^2+|\beta|^2=1.
$$

I identify these basis vectors with qubit $|0\rangle$ and $|1\rangle$. In my apparatus, however, $\alpha$ and $\beta$ describe electric-field amplitudes. With an ideal PBS, the normalized intensities are

$$
P_H=\frac{I_H}{I_H+I_V}=|\alpha|^2,\qquad
P_V=\frac{I_V}{I_H+I_V}=|\beta|^2.
$$

These have the same numerical form as Born probabilities. I see two classical light outputs, rather than a sequence of single-photon measurement outcomes.

## Why two equal spots were not the whole story

The PBS gives me access to amplitude magnitudes, but not directly to relative phase. For example,

$$
|+\rangle=\frac{|H\rangle+|V\rangle}{\sqrt2},\qquad
|-\rangle=\frac{|H\rangle-|V\rangle}{\sqrt2},\qquad
|\psi_i\rangle=\frac{|H\rangle+i|V\rangle}{\sqrt2}
$$

all give ideal 50/50 H/V outputs. The first two are different linear polarizations; the third is circular in this ideal model. Other amplitude and phase combinations give elliptical polarization.

This also explains a detail of my starting alignment. I orient the polarized laser so that the bare laser and PBS look roughly 50/50. That tells me about the two magnitudes, but does not identify the relative phase or prove that the laser is in $|+\rangle$. The LP inserted afterward prepares the linear input for each experiment.

A common factor $e^{i\gamma}$ changes the global phase and leaves polarization unchanged. Changing the phase between H and V changes the state. Normalized pure polarization states, with global phase removed, form the Poincaré sphere corresponding to the qubit Bloch sphere. A Jones vector describes coherent, fully polarized light; partially polarized light needs a coherence-matrix description.

## Turning a plate into a matrix

I measure plate angles from my H reference toward V. To keep the signs consistent, I use

$$
R(\theta)=
\begin{pmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{pmatrix},
\qquad
J_\Delta(\theta)=R(\theta)
\begin{pmatrix}1&0\\0&e^{i\Delta}\end{pmatrix}
R(-\theta).
$$

Here $\Delta$ is the retardance, the phase difference introduced between the plate's two axes. For an ideal half-wave plate, $\Delta=\pi$, giving

$$
W_{1/2}(\theta)=
\begin{pmatrix}
\cos(2\theta)&\sin(2\theta)\\
\sin(2\theta)&-\cos(2\theta)
\end{pmatrix}.
$$

Three settings were particularly useful:

$$
W_{1/2}(0^\circ)=Z=
\begin{pmatrix}1&0\\0&-1\end{pmatrix},
$$

$$
W_{1/2}(22.5^\circ)=H=
\frac1{\sqrt2}\begin{pmatrix}1&1\\1&-1\end{pmatrix},
\qquad
W_{1/2}(45^\circ)=X=
\begin{pmatrix}0&1\\1&0\end{pmatrix}.
$$

I use plain $H$ for the Hadamard gate and $|H\rangle$ for horizontal polarization. With H input, the 22.5° plate gives $H|H\rangle=|+\rangle$, so I expect two equal PBS outputs.

When I put plates in sequence, the rightmost operator acts first. Light passing through A and then B is described by $BA|\psi\rangle$. This makes two of my experiments direct matrix multiplications:

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

The first sequence returns the input; the second turns a phase change between Hadamards into an output swap.

## Making phase visible

For the quarter-wave plate I choose

$$
Q(0^\circ)=
\begin{pmatrix}
1&0\\
0&i
\end{pmatrix},
\qquad i^2=-1.
$$

This is consistent with $J_{\pi/2}(0^\circ)$: the H amplitude stays unchanged, while the V amplitude is multiplied by $i$. Fast/slow-axis and circular-handedness conventions vary; these equations specify mine.

Applying Q to $|+\rangle$ gives $|\psi_i\rangle$. Both still look 50/50 in H/V. If I add a Hadamard immediately before the PBS,

$$
H|+\rangle=|H\rangle,\qquad
H|\psi_i\rangle=
\frac{(1+i)|H\rangle+(1-i)|V\rangle}{2}.
$$

The first now gives ideal 100/0, while the second stays 50/50 because $|1\pm i|^2/4=1/2$. The extra plate changes the measurement basis. It is the step that lets the relative phase affect the spots I can see.

That is the part of single-qubit mathematics I can explore here. I am not reproducing quantum state collapse, photon-counting statistics, entanglement or many-qubit scaling. The [experiments](04-experiments.md) show what happened when I put these ideal matrices into imperfect physical holders.

---

**Next chapter:** [Putting the optics together](02-optical-components.md) →
