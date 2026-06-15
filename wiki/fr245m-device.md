# Forerunner 245 Music (fr245m)

The target device for this project.

## Connect IQ Specifications

| Specification      | Value                       |
|--------------------|-----------------------------|
| Device ID          | fr245m                      |
| Connect IQ Version | 3.3                         |
| Screen Resolution  | 240 × 240                   |
| Screen Shape       | Round                       |
| Screen Technology  | Memory-In-Pixel (64 colors) |
| App Memory         | 128 KB (device apps)        |
| App Slots          | 32 total (all types pooled) |
| App Storage        | 4.0 MB total                |

(source: connectiq-compatible-devices-fr245m.md, blog-real-devices-of-connectiq.md,
forum-fr245-app-memory.md)

## Hardware

- Bluetooth 4.2, ANT+, Wi-Fi
- 3.5 GB music storage (~500 songs); music plays via Bluetooth headphones only
- Water rating: 5 ATM
- Battery: up to 7 days watch mode, up to 6 hr GPS + music

(source: fr245-owners-manual-specs.md)

## Sound Hardware

The device has key tones and alert tones that can be toggled on/off, plus
vibration. (source: fr245-owners-manual-sounds.md)

The owner's manual does not specify whether the audio hardware is a beeper or a
speaker. However, the FR245 was released in 2019, before Garmin introduced
speakers in watches (Venu 2 Plus, 2022). Garmin's own blog groups the FR245
with the fēnix 6 series as "entry-level" 64-color MIP devices.
(source: blog-real-devices-of-connectiq.md)

Given the timeline and device class, the FR245M almost certainly has a hardware
tone generator (beeper), not a speaker. This means [[toneprofile-api]] custom
tones should work on it. **This has not been verified on the physical device.**

Additional evidence:

- The FR245M has a built-in metronome that "plays tones at a steady rhythm"
  for cadence training. (source: fr245-owners-manual-metronome.md)
- Garmin's official [[lidar-theremin]] sample app lists `fr245m` in its
  manifest and uses ToneProfile with frequencies 50–4000 Hz.
  (source: github-lidar-theremin-manifest.md)
- The [[vibratest]] developer tool also lists `fr245m` as a supported device.
  (source: github-vibratest-overview.md)

## Constraints for This Project

- 128 KB app memory — keep resources minimal, optimize bit depth
- 64 colors — limited palette for UI
- 240 × 240 round display — design for circular layout
- Beeper audio — single-frequency tones only, no chords, no audio files
- CIQ 3.3 — ToneProfile requires API 3.1.0, so the FR245M qualifies

See also: [[connect-iq-platform]], [[attention-api]], [[toneprofile-api]]
