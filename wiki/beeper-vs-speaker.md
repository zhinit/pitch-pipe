# Beeper vs. Speaker Devices

A critical hardware distinction that determines whether [[toneprofile-api]]
custom tones work on a given Garmin device.

## Beeper (Tone Generator) Devices

- Support custom ToneProfile tones (arbitrary frequency + duration)
- Play predefined tones through the beeper as characteristic electronic sounds
- Include all devices released before the Venu 2 Plus (early 2022), plus
  many newer devices that lack speakers

Confirmed beeper device families:
- fēnix 5/5S/5X, 5 Plus series, 6 series, 7 series, Chronos, E
- Forerunner 55, 70, 165, 170, 245, 255, 265, 645, 735xt, 745, 935, 945, 955, 965
- epix Gen 2, epix Pro Gen 2
- Instinct 2/2S/2X, Crossover, 3 series, E series
- MARQ Gen 1, MARQ Gen 2
- Venu (original), Venu 2 (non-Plus), Venu 2S, Venu Sq series
- vívoactive 3, 4, 5, 6
- Descent all models
- Enduro, Enduro 3
- D2 Delta, D2 Air X10, D2 Mach 1, D2 Mach 2
- Approach S50, S70
- All Edge cycling computers
- All GPSMAP/Montana/eTrex handhelds

(source: garmin-speaker-devices-research.md, forum-fenix8-toneprofile-bug.md,
forum-playtones-new-devices.md)

## Speaker Devices

- **Cannot** play custom ToneProfile tones (silently ignored)
- Play predefined tones as prerecorded audio files
- Have built-in speaker and microphone for phone calls / voice assistant

Confirmed speaker devices:
- **Venu 2 Plus** (2022) — first Garmin watch with speaker
- **Venu 3 / 3S** (2023)
- **Venu 4** 41mm / 45mm (2025)
- **Venu X1** (2025)
- **fēnix 8** all variants — 43mm, 47mm/51mm, Pro, Solar (2024)
- **Forerunner 570** 42mm / 47mm (2025)
- **Forerunner 970** (2025)
- **D2 Mach 2 Pro** (2025)

(source: garmin-speaker-devices-research.md, forum-fenix8-toneprofile-bug.md)

## Garmin's Statement

> "Products used to all have tone generators... When products like Venu 2 Plus
> came along, the hardware switched to a speaker that played pre-recorded
> built-in tones and could no longer play arbitrary tone profiles"

— Brandon.ConnectIQ (source: forum-fenix8-toneprofile-bug.md)

## API Gap

The `:hasToneSupport` annotation cannot distinguish between beeper and speaker
devices. `Attention has :ToneProfile` returns `true` on both. Garmin
acknowledged this limitation requires API-level improvements. There is no
runtime workaround — the only defense is not listing speaker devices in the
app manifest.

(source: forum-fenix8-toneprofile-bug.md, connectiq-toneprofile-supported-devices-2026.md)

## Rule of Thumb

Speaker = device has phone call / voice assistant capability from the wrist.
If a Garmin product page advertises "take calls from your wrist" or
"voice assistant," it has a speaker and ToneProfile will not work.

(source: garmin-speaker-devices-research.md)

See also: [[toneprofile-api]], [[attention-api]], [[multi-device-compatibility]],
[[fr245m-device]]
