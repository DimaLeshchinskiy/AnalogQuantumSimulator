# Electronics reference and design history

[The build story](03-hardware-and-development.md) · [Circuit files](../electro/main/) · [Firmware status](../firmware/README.md)

I keep the wiring details here so the development story can be read without stopping at every pin. These connections come from the saved schematic and PCB, cross-checked using a KiCad-exported netlist. They describe my design; my completed tests covered the controller and LEDs, not the full detector chain.

## The two analog channels

U1 is labeled **ATtiny13A-S** and U2 **TS912**, with both amplifier channels in one SOIC-8 footprint. The [ST datasheet](https://www.st.com/resource/en/datasheet/ts912.pdf) identifies TS912 as a dual operational amplifier; my files do not specify a more detailed ordering suffix.

For each channel, the noninverting input is at `GNDA`. The detector-cathode socket goes to the inverting input, with **10 kΩ in parallel with 100 nF** between that node and the amplifier output. J7 feeds U2 pins 2/1 and then PB4; J6 feeds U2 pins 6/7 and then PB3. Socket pins 2 and 3 connect to analog ground for anode and shield. The current BOM lists external BPW34 sockets rather than photodiodes populated on the main board.

```text
J7 detector socket → TS912 channel A → PB4 analog-input net ┐
J6 detector socket → TS912 channel B → PB3 analog-input net ├→ ATtiny13A → LEDs
                                                button ─┘
```

I did not preserve the original firmware, so these analog-input nets do not establish that the uploaded program sampled the ADC.

## Controller, indicators and programming connector

| U1 physical pin | Port / net | Schematic and PCB connection |
| --- | --- | --- |
| 1 | PB5 / `PB5_RST` | Reset; J1.5 |
| 2 | PB3 / `PB3_ADC_PHOTO` | U2 channel B output; TP4 |
| 3 | PB4 / `PB4_ADC_PHOTO` | U2 channel A output; TP3 |
| 4 | GND / `GNDD` | Digital ground |
| 5 | PB0 / `PB0_MOSI_LED` | R1 (330 Ω) to D3 anode; J1.4 |
| 6 | PB1 / `PB1_MISO_LED` | R2 (330 Ω) to D4 anode; J1.1 |
| 7 | PB2 / `PB2_SCK_BUTTON` | SW1 to digital ground; J1.3 |
| 8 | VCC | Supply; J1.2 |

Both LED cathodes are on digital ground, giving active-high drive in the schematic. SW1 shorts PB2 to ground when pressed, and no external pull-up is shown. An internal pull-up would supply the idle level, but I cannot verify the original software setting.

J1 is wired 1=MISO, 2=VCC, 3=SCK, 4=MOSI, 5=reset, 6=digital ground. These are circuit and package-pin assignments, not Arduino sketch pin numbers or a preserved Nano jumper diagram. PB0 and PB1 have hardware PWM functions OC0A and OC0B in the [Microchip datasheet](https://ww1.microchip.com/downloads/aemDocuments/documents/MCU08/ProductDocuments/DataSheets/ATtiny13A-Data-Sheet-DS40002307A.pdf). I cannot establish whether my original firmware used them or implemented PWM another way.

## Power

In the optical setup I power the laser from a **3 V power supply**. That is the operating arrangement I used, separate from what can be learned from the PCB drawing alone.

The saved supply circuit contains two series cell symbols, SW2 and an unnamed `TPS1` block. `VCC` feeds the controller, amplifier and laser connector; J3's value includes `VOUT_3V`. NT1 joins `GNDA`, `GNDD` and `GNDPWR`. The supply block lacks an identified part value and board footprint, so I cannot identify its installed converter or battery chemistry from these files.

## Design saves

The dates below come from KiCad commit timestamps in Prague summer time. They date saved design states, not board manufacture, assembly or optical tests. The [history bundle](evidence/README.md) contains the cited commits.

| Saved stage | Source states | Changes visible in the files |
| --- | --- | --- |
| 29 August 2026: first circuit | `b352ba7`, `75e9ca0`, `3ce7f46`, `10edf8c` | ATtiny13A-S, TS912 and BPW34 symbols; then a button, LED/resistor pairs and the six-pin programming connector. |
| 29 August: supply exploration | `ae8c72d`, `cdcf382`, `6cf8eac` | A mostly unconnected TPS63000 symbol was added and removed; an unnamed three-terminal supply block followed. |
| 29 August: detector interface | `3ba1aa1`, `502482f`, `9b6de96` | Feedback resistors changed from 100 kΩ to 10 kΩ; detector connections evolved into two three-pin BPW34/shield sockets. |
| 29 August: test access | `e35c4f0` through `563d900` | Supply/ground and analog-output test points appeared. |
| 30 August: power and filtering | `7108ad6`, `48caf2d` | Two series cell symbols replaced the earlier battery representation; both feedback capacitors changed from 47 pF to 100 nF. |
| 30–31 August: grounding and layout | `3f3a964` through `f199ae3` | Analog, digital and power grounds were joined through a three-way net tie; further PCB saves followed. |

Intermediate saves contain incomplete connections. I have no record of the reason for every value change or a measured analog response. The current schematic, local-history tip and archived schematic have matching netlist connectivity.

## Decisions in the build

| What I chose | Alternative | Why, and what followed |
| --- | --- | --- |
| Classical polarization optics | A genuinely quantum implementation | My aim was to make single-qubit algebra visible; this does not demonstrate quantum advantage. |
| Removable foil cassettes | A fixed optical sequence | I could reuse the same parts across experiments. |
| Indexed rotation | Continuous adjustment | The 22.5° steps include useful gate settings, while limiting fine correction. |
| A detector/controller board | Visual comparison alone | I wanted an electronic readout; its integration remained unfinished. |
| Visible spots for the final demonstrations | Completing and calibrating the readout first | The optical experiments already met my educational goal. |

---

**Next appendix:** [Notes on the surviving evidence](verification-notes.md) →
