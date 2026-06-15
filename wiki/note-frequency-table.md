# Note Frequency Table

Frequencies in Hz for 12-TET with A4 = 440 Hz ([[concert-pitch-a440]]).
Values from two independent sources cross-checked below.

## Pitch Pipe Range (C3–C6)

The practical range for a pitch pipe. All frequencies fall within the
[[toneprofile-api]] demonstrated range of 50–4000 Hz
(see [[lidar-theremin]]).

| Note  | Freq (Hz) | Rounded |
|-------|-----------|---------|
| C3    | 130.813   | 131     |
| C♯3   | 138.591   | 139     |
| D3    | 146.832   | 147     |
| D♯3   | 155.564   | 156     |
| E3    | 164.814   | 165     |
| F3    | 174.614   | 175     |
| F♯3   | 184.997   | 185     |
| G3    | 195.998   | 196     |
| G♯3   | 207.652   | 208     |
| A3    | 220.000   | 220     |
| A♯3   | 233.082   | 233     |
| B3    | 246.942   | 247     |
| C4    | 261.626   | 262     |
| C♯4   | 277.183   | 277     |
| D4    | 293.665   | 294     |
| D♯4   | 311.127   | 311     |
| E4    | 329.628   | 330     |
| F4    | 349.228   | 349     |
| F♯4   | 369.994   | 370     |
| G4    | 391.995   | 392     |
| G♯4   | 415.305   | 415     |
| A4    | 440.000   | 440     |
| A♯4   | 466.164   | 466     |
| B4    | 493.883   | 494     |
| C5    | 523.251   | 523     |
| C♯5   | 554.365   | 554     |
| D5    | 587.330   | 587     |
| D♯5   | 622.254   | 622     |
| E5    | 659.255   | 659     |
| F5    | 698.457   | 698     |
| F♯5   | 739.989   | 740     |
| G5    | 783.991   | 784     |
| G♯5   | 830.609   | 831     |
| A5    | 880.000   | 880     |
| A♯5   | 932.328   | 932     |
| B5    | 987.767   | 988     |
| C6    | 1046.502  | 1047    |

(source: wikipedia-piano-key-frequencies.md, muted-io-note-frequencies.md)

## Full Piano Range (A0–C8)

See raw/md/wikipedia-piano-key-frequencies.md for all 88 keys.

| Note | Freq (Hz) |
|------|-----------|
| A0   | 27.500    |
| C4   | 261.626   |
| A4   | 440.000   |
| C8   | 4186.009  |

(source: wikipedia-piano-key-frequencies.md)

## Source Cross-Check

The Wikipedia piano key frequencies table and the muted.io note frequency
chart agree on all values to the precision shown (3 decimal places for
Wikipedia, 2 for muted.io). No contradictions found.

## Integer Rounding for ToneProfile

The [[toneprofile-api]] takes `Lang.Number` (integer). Maximum rounding error
in the C3–C6 range is ~2.5 cents (at C3). Human pitch discrimination is
roughly 5–10 cents for trained ears, so integer Hz values are sufficient.

See also: [[equal-temperament]], [[concert-pitch-a440]], [[toneprofile-api]]
