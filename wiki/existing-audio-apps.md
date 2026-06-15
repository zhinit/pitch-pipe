# Existing Audio/Tone Apps on Connect IQ

A survey of Connect IQ apps that use audio or tones, to inform the pitch pipe
design.

## Apps That Use ToneProfile

### Lidar Theremin (official Garmin sample)

Plays continuous tones at 50–4000 Hz mapped from LIDAR distance. The only
known open-source app that exercises ToneProfile with a wide range of
arbitrary frequencies. See [[lidar-theremin]].
(source: github-lidar-theremin-controller.md)

### VibraTest (developer tool)

Lets developers enter arbitrary frequency/duration pairs and hear them on the
device. See [[vibratest]].
(source: github-vibratest-overview.md, forum-vibe-tone-profile-test.md)

## Apps That Use Predefined Tones or Vibration

### Metronome (Connect IQ Store)

A wearable metronome for playing instruments. Supports 2/4, 3/4, 4/4, 5/4,
6/8, 7/8 time signatures. No source code available.
(source: web search results)

### WorkoutTimer

Countdown timer using vibration alerts only — no tone playback.
(source: awesome-garmin-audio-apps.md)

### Meditation apps (MeditateInstinct2, Meditate235)

Use vibration for session notifications ("longer vibration in the end and
small blip every 5min"). No ToneProfile usage found.
(source: web search results)

### Packman (game)

Uses `Attention.playTone(Attention.TONE_DISTANCE_ALERT)` — predefined tones
only, no custom frequencies.
(source: web search results)

## Built-in FR245M Metronome

The FR245M has a native metronome that "plays tones at a steady rhythm" for
cadence training during runs. This confirms the device has a working tone
generator. Settings include BPM, alert frequency, and sound/vibration
customization. (source: fr245-owners-manual-metronome.md)

## Gaps

No existing pitch pipe, tuner, or musical-frequency tone app was found in the
Connect IQ Store or on GitHub. The pitch pipe app would be the first of its
kind.

See also: [[toneprofile-api]], [[beeper-vs-speaker]], [[fr245m-device]]
