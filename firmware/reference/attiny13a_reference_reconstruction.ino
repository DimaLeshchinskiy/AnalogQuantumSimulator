/*
 * ATtiny13A optical demonstrator — ILLUSTRATIVE RECONSTRUCTION ONLY
 *
 * This is NOT the original firmware. The original uploaded/programmed sketch
 * was not preserved in the material currently available.
 *
 * Known history: ATtiny13A, Arduino Nano as ISP, button, two LEDs, four modes,
 * PWM behavior, LED orientation corrected during hardware debugging.
 * Unknown: pin mapping, active LED polarity, exact four modes, PWM semantics,
 * button wiring, timing and ADC connections.
 *
 * DO NOT FLASH TO HARDWARE UNTIL PINOUT / ELECTRICAL BEHAVIOR ARE VERIFIED.
 * Intended as an educational code reference for the documentation only.
 */

#include <Arduino.h>

// Deliberately block compilation until actual schematic is checked.
#ifndef OPTICAL_BOARD_PINOUT_VERIFIED
#error "Verify PCB pinout, button circuit and LED polarity; then define OPTICAL_BOARD_PINOUT_VERIFIED and configure the pins below."
#endif

// EXAMPLE assignments ONLY — replace with actual PCB pin mapping.
#ifndef PIN_BUTTON
#define PIN_BUTTON 3
#endif
#ifndef PIN_LED_A
#define PIN_LED_A 0
#endif
#ifndef PIN_LED_B
#define PIN_LED_B 1
#endif

// EXAMPLE electrical assumptions: button pulls LOW, LEDs active HIGH.
// Verify these against the real circuit before running.
#ifndef LED_ACTIVE_HIGH
#define LED_ACTIVE_HIGH 1
#endif

static uint8_t modeIndex = 0;
static uint8_t stableButton = HIGH;
static uint8_t lastRawButton = HIGH;
static unsigned long lastTransitionMs = 0;
static const unsigned long debounceMs = 35;

static void setLed(uint8_t pin, bool on) {
  digitalWrite(pin, (on == (LED_ACTIVE_HIGH != 0)) ? HIGH : LOW);
}

void setup() {
  pinMode(PIN_BUTTON, INPUT_PULLUP);  // EXAMPLE: verify button wiring.
  pinMode(PIN_LED_A, OUTPUT);
  pinMode(PIN_LED_B, OUTPUT);
  setLed(PIN_LED_A, false);
  setLed(PIN_LED_B, false);
}

void loop() {
  const uint8_t raw = digitalRead(PIN_BUTTON);
  const unsigned long now = millis();
  if (raw != lastRawButton) lastTransitionMs = now;
  if ((now - lastTransitionMs) >= debounceMs && raw != stableButton) {
    stableButton = raw;
    if (stableButton == LOW) modeIndex = (modeIndex + 1) & 0x03;
  }
  lastRawButton = raw;

  // These four LED patterns are EXAMPLES, NOT the original four modes.
  // Software PWM is illustrative; timing/frequency are not calibrated.
  const uint8_t pwmPhase = (uint8_t)(now & 0xFF);
  switch (modeIndex) {
    case 0: setLed(PIN_LED_A, false); setLed(PIN_LED_B, false); break;
    case 1: setLed(PIN_LED_A, true);  setLed(PIN_LED_B, false); break;
    case 2: setLed(PIN_LED_A, false); setLed(PIN_LED_B, true);  break;
    default:
      setLed(PIN_LED_A, pwmPhase < 192); // 75% illustrative duty cycle
      setLed(PIN_LED_B, pwmPhase < 64);  // 25% illustrative duty cycle
      break;
  }
}
