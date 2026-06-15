# ToneProfile API (Toybox.Attention.ToneProfile)

ToneProfile is the mechanism for playing custom-frequency tones on Garmin
devices. It is the core API for a pitch pipe app.

## Constructor

```monkeyc
new Attention.ToneProfile(aFrequency as Lang.Number, aDuration as Lang.Number)
```

- **aFrequency**: pitch in hertz (Hz)
- **aDuration**: length in milliseconds (ms)

(source: connectiq-toneprofile-api.md)

## Usage

Multiple ToneProfile objects can be passed as an array to
`Attention.playTone()`:

```monkeyc
var toneProfile = [
    new Attention.ToneProfile(2500, 250),
    new Attention.ToneProfile(5000, 250),
];
Attention.playTone({:toneProfile=>toneProfile});
```

The tones play sequentially — there is no way to play multiple frequencies
simultaneously. (source: connectiq-toneprofile-api.md,
forum-simultaneous-tones.md)

## Availability

- Available since API Level 3.1.0
- The [[fr245m-device]] runs CIQ 3.3, so ToneProfile is available

(source: connectiq-toneprofile-api.md)

## Frequency and Duration Ranges

The API documentation does not specify minimum or maximum valid ranges for
frequency or duration. (source: connectiq-toneprofile-api.md)

## Hardware Requirement

ToneProfile only works on devices with a hardware tone generator (beeper).
Devices with a speaker (Venu 2 Plus, Fenix 8, etc.) cannot play custom tone
profiles — they can only play predefined tones.
(source: forum-fenix8-toneprofile-bug.md, forum-playtones-new-devices.md)

See [[beeper-vs-speaker]] for details.

## Limitations

1. **Single frequency only** — calling playTone a second time cancels the
   first; rapidly alternating frequencies produces buzzing, not harmony
   (source: forum-simultaneous-tones.md)
2. **No custom audio files** — WAV, MP3, etc. are not supported
   (source: forum-playtones-new-devices.md)
3. **Simulator vs. hardware divergence** — ToneProfile works in the simulator
   for all devices but may fail silently on physical speaker-based hardware
   (source: forum-tones-not-playing-venu2plus.md)

See also: [[attention-api]], [[beeper-vs-speaker]], [[fr245m-device]]
