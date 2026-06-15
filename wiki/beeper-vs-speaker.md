# Beeper vs. Speaker Devices

A critical hardware distinction that determines whether [[toneprofile-api]]
custom tones work on a given Garmin device.

## Beeper (Tone Generator) Devices

- Support custom ToneProfile tones (arbitrary frequency + duration)
- Play predefined tones through the beeper as characteristic electronic sounds
- Include older devices: Fenix 5X Plus, Epix 2, Forerunner 245 series,
  fēnix 6 series

(source: forum-fenix8-toneprofile-bug.md, forum-playtones-new-devices.md)

## Speaker Devices

- **Cannot** play custom ToneProfile tones
- Play predefined tones as prerecorded audio files
- Include newer devices: Venu 2 Plus, Venu 3S, Fenix 8

(source: forum-fenix8-toneprofile-bug.md)

## Garmin's Statement

> "Products used to all have tone generators... When products like Venu 2 Plus
> came along, the hardware switched to a speaker that played pre-recorded
> built-in tones and could no longer play arbitrary tone profiles"

— Brandon.ConnectIQ (source: forum-fenix8-toneprofile-bug.md)

## API Gap

The `:hasToneSupport` annotation cannot distinguish between beeper and speaker
devices. Garmin acknowledged this limitation requires API-level improvements.
The "rule of thumb" is to expect ToneProfile to not work on devices with a
speaker, which "will likely include most of the newer products."
(source: forum-fenix8-toneprofile-bug.md)

## Implications for This Project

The [[fr245m-device]] was released in 2019, before speakers were introduced in
Garmin watches (2022). It plays music only via Bluetooth headphones, not
through a built-in speaker. It is grouped by Garmin with other beeper devices
(fēnix 6 series). ToneProfile should work, but this is unverified on the
physical device.

See also: [[toneprofile-api]], [[attention-api]], [[fr245m-device]]
