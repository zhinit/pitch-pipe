# Forum: KEY_START vs KEY_ENTER

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/1955/sim_bug----key_start-vs-key_enter
Fetched: 2026-06-14

## Problem

A developer reported inconsistency between the simulator and hardware on the
FR630. The simulator showed KEY_ENTER for the right-hand top button, but
actual hardware generated KEY_START instead.

## Key Constants

- KEY_ENTER = 4 (The enter key)
- KEY_START = 18 (The start key, since API 1.1.2)

## Garmin Staff Clarification

The FR630's physical button wasn't designed as an enter key but as a start
key. Garmin indicated a fix was coming to align the hardware behavior with
the simulator.

## Device-Specific Behavior

The FR630 has unique button mappings compared to other Connect IQ devices:
- Right lower button = LAP button
- Left lower button = BACK/ESC button
- These differ from the FR230/235 and F3

Staff noted the FR630 "has a bit of a different paradigm with regard to
buttons."

## Developer Workaround

Ensure input delegates return `true` to indicate key handling and potentially
prevent unintended native behavior triggering.
