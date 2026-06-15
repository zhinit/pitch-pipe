# Why Do Tones Not Play on the Watch but Do in the Simulator?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/317894/why-do-tones-not-play-on-the-watch-but-do-in-the-simulator
Fetched: 2026-06-14

## The Issue

A developer reported that their app plays tones correctly in the simulator but
fails to produce sound on an actual Venu 2 Plus device, despite the watch
supporting tone functionality.

## Root Cause

ToneProfile-based custom tones don't work on the physical device, even though
the documentation claims support for this feature on the Venu 2 Plus.

## Affected Devices

- Venu 2 Plus (confirmed)

## Solution

Standard tone playback works correctly on both simulator and hardware:

```monkeyc
Attention.playTone(Attention.TONE_LOUD_BEEP);
```

Custom ToneProfile objects — which work fine in the simulator — fail silently on
actual devices. The recommended workaround is to use predefined tone constants
instead of ToneProfile arrays.

## Key Finding

One community member noted: "The Attention sample has fallback code to play a
regular tone if ToneProfile is unavailable." This suggests either a
documentation bug, a simulator bug, or incomplete hardware support.
