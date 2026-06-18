# PlayTones on New Devices — Full Thread

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/416441/playtones-on-new-devices
Fetched: 2026-06-17

## DaveBrillhart (Original Post, ~11 months ago)

Describes issues with playtone functions on new devices like EDGE 1050.
Notes difference between Tone Generator sounds and Speaker-based devices.
Requests guidance on device detection logic.

## flowstate (Reply 1, ~11 months ago)

"ToneProfile only works on devices with a beeper / hardware tone
generator, not on devices with a real speaker."

Predefined tones play as prerecorded audio through speakers/headphones.

## flowstate (Reply 2, ~11 months ago)

"you cannot use your own prerecorded audio files, you can only use the
predefined tones that Garmin supplies"

## DaveBrillhart (Reply 3, ~11 months ago)

Seeks clarification on generating custom audio files for speaker-based
devices.

## jim_m_58 (Reply 4, ~11 months ago)

"You can not add your own tone files. You need to use the standard ones
like TONE_CANARY"

## flowstate (Reply 5, ~11 months ago)

References Brandon.ConnectIQ statement about future custom audio:
"This has been discussed, but it hasn't yet been prioritized"

## flocsy (Reply 6, ~11 months ago)

Advocates Garmin should provide API to check custom tone capability.

## jeromej_ (Reply 7, ~10 months ago)

Reports SDK compatibility issues between versions.

## gasteropod (Reply 8, ~10 months ago)

References official Garmin response: speaker devices "cannot generate
tones, only play tones which are loaded"
