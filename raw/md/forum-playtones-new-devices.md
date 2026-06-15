# PlayTones on New Devices — Forum Discussion

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/416441/playtones-on-new-devices
Fetched: 2026-06-14

## ToneProfile Support

ToneProfile only works on devices equipped with a hardware beeper or tone
generator. Newer Garmin devices with speakers cannot use ToneProfiles because
they lack the necessary tone generation hardware.

## Beeper vs. Speaker Devices

### Devices with a beeper/tone generator

- Support custom ToneProfiles (frequency/duration sequences)
- Play predefined tones through the beeper with characteristic electronic sounds
- Cannot play custom ToneProfiles through headphones

### Devices with a speaker

- Cannot generate custom tones via ToneProfile
- Can only play Garmin's built-in predefined tones like TONE_CANARY and
  TONE_ALARM
- These predefined tones use prerecorded audio files embedded in the device

## Key Limitation

"You cannot add your own tone files. You need to use the standard ones like
TONE_CANARY." Custom audio files (WAV, MP3, etc.) are not currently supported.

## FR245M Status

The document does not mention the FR245M specifically. However, the Edge 1050
(a speaker-based device) is noted to render TONE_CANARY reasonably well but
produces only quick beeps for other predefined tones.
