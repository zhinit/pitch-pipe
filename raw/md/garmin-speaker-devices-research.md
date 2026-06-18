# Garmin Devices With Built-In Speaker and Microphone

Sources:
- https://www.garmin.com/en-US/blog/fitness/the-difference-between-garmin-forerunner-965-and-970/
- https://garminrumors.com/models/forerunner-570/
- https://garminrumors.com/models/venu-4/
- https://wiki.garminrumors.com/Venu_2_Plus
- https://wiki.garminrumors.com/Venu_3
- https://wiki.garminrumors.com/Vivoactive_5
- https://www.dcrainmaker.com/2023/03/garmin-forerunner-965-depth-review.html
- https://www.dcrainmaker.com/2025/05/garmin-forerunner-everything.html
- https://www.heartratemonitorsusa.com/products/garmin-vivoactive-6-gps-smartwatch
- https://forums.garmin.com/developer/connect-iq/i/bug-reports/fenix-8---no-sound-from-app-when-using-toneprofile
Fetched: 2026-06-17

## Devices WITH speaker and microphone

The Venu 2 Plus (2022) was the first Garmin watch with a built-in speaker
and microphone, enabling phone calls and voice assistant from the wrist.

### Confirmed speaker devices:

- Venu 2 Plus (2022) — first Garmin watch with speaker
- Venu 3 / Venu 3S (2023) — speaker and microphone
- Venu 4 41mm / 45mm (2025) — speaker and microphone for calls
- Venu X1 (2025) — speaker (based on Venu line positioning)
- fēnix 8 all variants (2024) — speaker and microphone
- Forerunner 570 42mm / 47mm (2025) — speaker and microphone
- Forerunner 970 (2025) — speaker and microphone
- D2 Mach 2 Pro (2025) — speaker (aviation watch, same platform as fēnix 8)

### Impact on ToneProfile

From Brandon.ConnectIQ (Garmin employee) on the fēnix 8 bug report:

> "Products used to all have tone generators... When products like Venu 2
> Plus came along, the hardware switched to a speaker that played
> pre-recorded built-in tones and could no longer play arbitrary tone
> profiles"

Speaker devices can play predefined tones (TONE_KEY, TONE_ALARM, etc.)
but CANNOT play custom ToneProfile objects with arbitrary frequencies.
Custom ToneProfile calls are silently ignored.

## Devices WITHOUT speaker (beeper only)

### Confirmed no-speaker:

- Forerunner 965 (2023) — no speaker, no microphone (Garmin's own FR965
  vs FR970 comparison highlights speaker as a FR970 upgrade)
- Forerunner 265 / 265s (2023) — no speaker
- vívoactive 5 (2023) — no speaker, cannot make/receive calls
- vívoactive 6 (2025) — no speaker, cannot make/receive calls
- fēnix E (2025) — no speaker (product pages say "step up to Venu 4 or
  Forerunner 570 for speaker")
- Enduro 3 (2025) — no speaker mentioned in any product materials
- Instinct 3 series (2024) — no speaker mentioned
- Instinct E series (2024) — no speaker mentioned
- Forerunner 70 (2025) — budget model, no speaker
- Forerunner 170 / 170 Music (2025) — no speaker mentioned

All devices released before the Venu 2 Plus (early 2022) have beepers,
not speakers:
- All fēnix 5/6/7 series
- All Forerunner 245/255/55/645/735/745/935/945/955
- All Instinct 2 series
- All MARQ Gen 1 and Gen 2
- All epix Gen 2 / epix Pro Gen 2
- Venu (original), Venu 2 (non-Plus), Venu 2S, Venu Sq series
- All vívoactive 3/4 series
- All Descent series
- All Edge cycling computers
- All GPSMAP/Montana/eTrex handhelds

## No runtime detection

The Connect IQ API has no way to distinguish beeper from speaker devices
at runtime. The `Attention has :ToneProfile` annotation returns true on
both. Garmin has acknowledged this limitation but has not provided a fix.
