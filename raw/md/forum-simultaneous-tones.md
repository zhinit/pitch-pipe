# Is There a Way to playTone with Two or More Frequencies at the Same Time?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/289367/is-there-a-way-to-playtone-with-two-or-more-frequencies-at-the-same-time
Fetched: 2026-06-14

## The Core Problem

The original poster discovered that Garmin's Connect IQ playTone function
cannot play multiple frequencies at the same time. When attempting to call
playTone twice sequentially, "the second playTone call wins. You never hear
the first."

## Attempted Solutions

### Sequential Tones Approach

The developer tried rapidly alternating between frequencies within a single
ToneProfile array, cycling through 523 Hz, 659 Hz, and 784 Hz with very short
durations (5–20 ms each). This produced undesirable "buzzing" artifacts rather
than a harmonic blend.

### Why This Doesn't Work

According to forum participants, playing two tones simultaneously requires
either:

1. Hardware-level audio mixing capabilities (unavailable in Connect IQ)
2. True parallel code execution/threading (not supported)
3. Pre-calculated waveform synthesis combining both frequencies mathematically

## Technical Insights

One participant noted that "adding two frequencies will produce complex signal,
3 resulting frequencies. There is no simple way to calculate frequency F3 for
F1 + F2."

The underlying audio implementation appears to use pulse-width modulation for
tone generation, with precision limited to millisecond-level duration
control — insufficient for synthesizing combined waveforms.

## Current Limitations

Connect IQ provides no documented API for audio mixing or simultaneous
multi-frequency playback, and the platform lacks threading capabilities that
might enable workarounds.
