# Putting the optics together

[Project](../README.md) · [The mathematics](01-theory.md) · [Next: building the apparatus](03-hardware-and-development.md)

I wanted to be able to change a calculation without rebuilding the apparatus. The physical version of that idea was a set of small foil cassettes: take one out, rotate it, put another in, and compare the two output spots.

![The assembled rail with five cassette holders and a loose inventory of three HWP, two QWP and two LP cassettes](../images/full_setup.jpg)

*The seven labeled cassettes beside the rail. The empty holders let me see the laser/PBS starting configuration before preparing an input.*

The built setup has five cassette positions. My saved OpenSCAD assembly shows four, so it represents an earlier arrangement rather than the full photographed rail. The holders share a cassette interface, and the indexed ring has sixteen positions: $360^\circ/16=22.5^\circ$ per step.

## Starting with the laser

I power the laser from a **3 V power supply**. I found that it is already polarized, so its orientation matters even before I add any foils. I start with every cassette removed and adjust the laser's orientation until the PBS produces approximately equal spots. In practice this roughly 50/50 starting point has given me the best results.

I keep this adjustment separate from state preparation. Equal H/V intensity does not mean unpolarized light, and it does not determine relative phase. Once I insert an LP, the LP's axis defines the linear polarization that goes into the gates.

For H input I align the LP with one PBS basis direction; rotating it by 90° prepares V. In the ideal model, an LP transmits intensity proportional to $\cos^2\phi$ for incident linear polarization at angle $\phi$ to its axis. It is a lossy preparation element rather than a unitary gate. The balanced starting alignment helps avoid strongly favoring one preparation direction, but my reason for using it is the practical result I observed.

I name the two PBS channels H and V using the LP test. Their labels refer to polarization, not to an assumption that H must be transmitted or reflected.

## The plates I use as gates

An HWP changes the relative phase along its own axes by $\pi$. With the convention from the [theory chapter](01-theory.md#turning-a-plate-into-a-matrix), it sends a linear polarization angle $\phi$ to $2\theta-\phi$. This is why a plate at 45° swaps H and V, while one at 22.5° takes H to diagonal polarization.

At 0° the HWP acts as Z. It does not change H/V intensities by itself, which made it a useful oracle for the Deutsch–Jozsa experiment: the change only becomes visible after another Hadamard.

The QWP introduces a quarter-cycle relative phase. In my convention, a QWP at 0° takes $(|H\rangle+|V\rangle)/\sqrt2$ to $(|H\rangle+i|V\rangle)/\sqrt2$. I use a second HWP before the PBS to compare those states in another basis.

The discrete angles make these nominal gate settings convenient, but the optical axis belongs to the foil, not to the printed label. A cassette can fit the holder perfectly while its true axis is offset. The foil's retardance also depends on wavelength. I have not identified the installed laser's wavelength, optical power or the exact foil models, so I do not treat the labels as a full optical calibration.

## Following the beam

For the gate experiments, my chain is

```text
Laser → LP input → HWP / QWP sequence → PBS → two paper targets
```

I leave unused holders empty. The most crowded sequence here is the QWP comparison with its final analyzer: LP, HWP, QWP, HWP. It uses four of the five positions.

The two spots are enough to follow the qualitative changes. I also made holders and a circuit for two BPW34 photodiodes, but did not finish that readout. The next chapter is the story of that mechanical and electronic work; the [experiment chapter](04-experiments.md) follows the light through each photographed sequence.
