# Optical hardware as gates

[Project](../README.md) · [Theory](01-theory.md) · [Next: development](03-hardware-and-development.md)

## Light source and preparation

The laser provides the beam; its installed wavelength and power are not documented. The input linear polarizer prepares a linear polarization along its transmission axis, provided some light is transmitted. In Jones notation its ideal action is a projection onto that axis, followed by normalization when describing the surviving polarization. It discards light and is not a unitary gate.

Rotating the LP through 90° prepares H or V relative to the PBS reference. Establish which output corresponds to each state experimentally; do not assume H must be the transmitted port. For a linearly polarized input at angle $\phi$ to an ideal LP, the transmitted intensity is proportional to $\cos^2\phi$.

## Half-wave plates

The [declared Jones matrix](01-theory.md#matrices-and-conventions) turns a linear polarization angle $\phi$ into $2\theta-\phi$. Relative to a calibrated reference:

| Nominal HWP axis | Gate analog | Effect |
| --- | --- | --- |
| 0° | Z | Reverses the relative sign of V |
| 22.5° | Hadamard | Converts H to diagonal + polarization |
| 45° | X | Swaps H and V |

Z leaves the H/V intensities unchanged when applied alone. A later gate can reveal its relative-phase change. Ideal +45° and −45° HWPs differ by a global sign, so they implement the same polarization transformation. A plate at 0° followed by one at 45° is generally **not** identity.

## Quarter-wave plates and the PBS

A QWP introduces a quarter-cycle relative phase at its design wavelength. With $Q(0^\circ)=\operatorname{diag}(1,i)$, diagonal + input becomes $(|H\rangle+i|V\rangle)/\sqrt2$. Other orientations and inputs produce elliptical or linear polarization. Retardance depends on wavelength; the foil model and its compatibility with the installed laser remain unverified.

The PBS analyzes H/V amplitudes into separate spots. It does not directly measure relative phase. An HWP at 22.5° immediately before it converts a diagonal-basis comparison into H/V output intensities. The [QWP procedure](04-experiments.md#6-qwp-phase-hidden-from-hv-intensity) compares these two analysis settings; H/V equality alone cannot certify circular polarization.

## Cassettes and optical references

The cassette geometry permits holders to be reused for different foils. Its 16 index positions give 22.5° increments, but a printed mark does not identify the foil's true axis. Establish H/V using the LP/PBS, then reference wave-plate axes to it. Discrete indexing provides nominal settings; it cannot establish exact optical angles or correct arbitrary offsets.

```text
Laser → LP preparation → removable HWP / QWP / oracle sequence → PBS
                                                               ├→ spot H
                                                               └→ spot V
```

> **Images pending:** `optical-chain-labeled.jpg` should identify beam direction, cassette order and both PBS channels; `cassette-detail.jpg` should show foil labels and indexing.

| Item | Quantity / status | Evidence |
| --- | --- | --- |
| Laser and PBS | One each in reported setup | Mechanical models and owner account; installed specifications unknown |
| HWP / QWP / LP cassettes | Reported 3 / 2 / 2 | Owner account; photographic inventory pending |
| Indexed holder positions | Four in saved CAD; five reported built | Explicit discrepancy, not a verified five-position BOM |
| BPW34 detector positions | Two modeled; two external sockets in circuit | Intended optional readout, not completed optical integration |

This is a configuration guide, not a procurement BOM. CAD placeholder dimensions do not establish installed optical models. The experiments use at most four cassettes, so the saved four-holder arrangement accommodates the listed procedures.
