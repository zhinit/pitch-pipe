# Speaker Audio Limitation

On Garmin devices with speakers (see [[beeper-vs-speaker]]), there is no
Connect IQ API to play custom audio through the speaker. This page
documents what was investigated and why none of it works for a pitch pipe.

## What speaker devices can play

Only Garmin's ~20 predefined tones: `TONE_KEY`, `TONE_START`, `TONE_STOP`,
`TONE_ALARM`, `TONE_CANARY`, etc. These are prerecorded audio files baked
into the firmware. None are tuned musical pitches.

Custom `ToneProfile` calls (arbitrary frequency + duration) are silently
ignored on speaker devices.

(source: forum-playtones-new-devices-full.md, forum-fenix8-toneprofile-bug.md)

## Audio Content Provider apps

Connect IQ has an `audio-content-provider-app` type designed for music
streaming services (Spotify, Deezer, etc.). It supports MP3, M4A, WAV,
and ADTS formats.

This does not help because:

1. **It's a different app type.** A `watch-app` cannot use the Media API.
   The pitch pipe would need to be rewritten as an entirely different kind
   of application.
2. **Playback goes through the system media player.** The app provides
   content references; the system player handles playback. The app cannot
   trigger "play this sound now" — the user must navigate the media player
   UI.
3. **Content must be synced from a CDN.** Audio files are downloaded from
   a web server over Wi-Fi and stored encrypted on the device. There is no
   way to bundle audio files with the app or generate them on-device.
4. **UX mismatch.** The user experience would be "open music player, pick
   a track" rather than "tap a note, hear a pitch."

(source: connectiq-media-api.md, connectiq-audiocontentproviderapp-api.md,
blog-creating-music-apps-ciq3.md)

## Custom audio files on speaker devices

Developers have asked Garmin about playing custom audio files (WAV/MP3)
through the speaker from a regular app. The answers:

- "you cannot use your own prerecorded audio files, you can only use the
  predefined tones that Garmin supplies" — flowstate
  (source: forum-playtones-new-devices-full.md)

- "You can not add your own tone files. You need to use the standard ones
  like TONE_CANARY" — jim_m_58
  (source: forum-playtones-new-devices-full.md)

- Custom audio for speaker devices "has been discussed, but it hasn't yet
  been prioritized" — Brandon.ConnectIQ
  (source: forum-playtones-new-devices-full.md)

## Conclusion

Speaker-equipped Garmin devices cannot run a pitch pipe. No workaround
exists in the current Connect IQ SDK. This may change if Garmin adds a
custom audio playback API in a future SDK version, but there is no
timeline for this.

The pitch pipe app can only target [[beeper-vs-speaker|beeper devices]].
See [[multi-device-compatibility]] for the full list of compatible devices.

See also: [[attention-api]], [[toneprofile-api]], [[beeper-vs-speaker]],
[[multi-device-compatibility]]
