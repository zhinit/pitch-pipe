# Forum: onKeyPressed and onKeyReleased on FR230, 235 & 735

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/4562/onkeypressed-and-onkeyreleased-on-fr230-235-735
Fetched: 2026-06-14

## Core Issue

Developer eran_levi reported that onKeyPressed() and onKeyReleased() callbacks
work fine in the emulator and on Fenix 3 devices, but fail completely on
Forerunner 230, 235, and 735 physical devices.

## Garmin Staff Response

Travis Vitek (Garmin) confirmed this is a documented problem:

> "The onKeyPressed() and onKeyReleased() functionality doesn't work, or at
> least doesn't work with many devices, at this point in time."

On most tested devices (except one), the callback functions weren't invoked at
all — not just receiving unexpected key codes.

## Key Findings

- The emulator behaves as intended but doesn't match actual device behavior
- The issue affects multiple FR models (230/235/735)
- Root cause: unknown from this discussion

## Official Recommendation

Travis Vitek explicitly stated:

> "No. To be safe, you should avoid using onKeyPressed() and onKeyReleased()."

He recommended developers redesign applications to avoid relying on these
callbacks entirely.

## Note

The discussion does not address whether this was fixed in later SDK versions
or newer Forerunner models like the FR245.
