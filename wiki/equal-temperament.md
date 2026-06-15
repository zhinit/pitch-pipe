# Equal Temperament (12-TET)

12-tone equal temperament is the standard Western tuning system. It divides the
octave into 12 equal semitones on a logarithmic scale.
(source: wikipedia-equal-temperament.md)

## Semitone Ratio

The frequency ratio between adjacent semitones:

    2^(1/12) ≈ 1.059463

Each semitone = 100 cents. One octave = 1200 cents.
(source: wikipedia-equal-temperament.md)

## Frequency Formula

    f(n) = 2^((n−49)/12) × 440

Where n is the piano key number (1–88), with key 49 = A4 = 440 Hz.
(source: wikipedia-piano-key-frequencies.md)

Equivalently:

    Pn = Pa × (2^(1/12))^(n−a)

Where Pa is a reference frequency and n, a are semitone positions.
(source: wikipedia-equal-temperament.md)

## Practical Consequence

Every octave doubles the frequency. A3 = 220 Hz, A4 = 440 Hz, A5 = 880 Hz.
Every semitone multiplies the frequency by ≈1.0595.

## Relevance to This Project

The [[toneprofile-api]] takes frequency as a `Lang.Number` (integer Hz). The
question is whether rounding to the nearest integer introduces audible error.

For the pitch pipe range (roughly C3–C6):
- C3 = 130.813 Hz → 131 Hz (error: +0.14%, ~2.5 cents)
- A4 = 440.000 Hz → 440 Hz (exact)
- C6 = 1046.502 Hz → 1047 Hz (error: +0.05%, ~0.8 cents)

Human pitch discrimination is roughly 5–10 cents for trained musicians, so
integer rounding is acceptable across this range.

See also: [[concert-pitch-a440]], [[note-frequency-table]]
