# Multi-Device Compatibility

How to expand this pitch pipe app beyond the [[fr245m-device]] to support
other Garmin watches.

## The constraint: beeper vs speaker

The app uses [[toneprofile-api]] to play musical pitches at specific
frequencies. This only works on devices with a **beeper** (hardware tone
generator). Devices with a **speaker** silently ignore custom ToneProfile
calls and can only play Garmin's pre-recorded tones.

See [[beeper-vs-speaker]] for the full device breakdown.

## Candidate beeper devices (watches only)

These watches have CIQ 3.1+ (required for ToneProfile) and are confirmed
or expected to have beepers. Product IDs are the strings used in
`manifest.xml`.

### fēnix series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| fēnix 5 / quatix 5 | fenix5 | 3.1 | 240×240 round |
| fēnix 5S | fenix5s | 3.1 | 218×218 round |
| fēnix 5X / tactix Charlie | fenix5x | 3.1 | 240×240 round |
| fēnix 5 Plus | fenix5plus | 3.3 | 240×240 round |
| fēnix 5S Plus | fenix5splus | 3.3 | 218×218 round |
| fēnix 5X Plus | fenix5xplus | 3.3 | 240×240 round |
| fēnix Chronos | fenixchronos | 3.1 | 218×218 round |
| fēnix 6 / 6 Solar / 6 Dual Power | fenix6 | 3.4 | 260×260 round |
| fēnix 6 Pro / 6 Sapphire / quatix 6 | fenix6pro | 3.4 | 260×260 round |
| fēnix 6S / 6S Solar / 6S Dual Power | fenix6s | 3.4 | 240×240 round |
| fēnix 6S Pro / 6S Sapphire | fenix6spro | 3.4 | 240×240 round |
| fēnix 6X Pro / tactix Delta / quatix 6X | fenix6xpro | 3.4 | 280×280 round |
| fēnix 7 / quatix 7 | fenix7 | 5.2 | 260×260 round |
| fēnix 7S | fenix7s | 5.2 | 240×240 round |
| fēnix 7X / tactix 7 / quatix 7X / Enduro 2 | fenix7x | 5.2 | 280×280 round |
| fēnix 7 Pro | fenix7pro | 5.2 | 260×260 round |
| fēnix 7S Pro | fenix7spro | 5.2 | 240×240 round |
| fēnix 7X Pro | fenix7xpro | 5.2 | 280×280 round |
| fēnix E | fenixe | 6.0 | 240×240 round |

(source: connectiq-compatible-devices-full.md, garmin-speaker-devices-research.md)

### Forerunner series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| Forerunner 245 | fr245 | 3.3 | 240×240 round |
| Forerunner 245 Music | fr245m | 3.3 | 240×240 round |
| Forerunner 645 | fr645 | 3.1 | 240×240 round |
| Forerunner 645 Music | fr645m | 3.2 | 240×240 round |
| Forerunner 935 | fr935 | 3.1 | 240×240 round |
| Forerunner 945 | fr945 | 3.3 | 240×240 round |
| Forerunner 945 LTE | fr945lte | 3.4 | 240×240 round |
| Forerunner 55 | fr55 | 3.4 | 208×208 round |
| Forerunner 70 | fr70 | 6.0 | 208×208 round |
| Forerunner 165 | fr165 | 5.2 | 390×390 round |
| Forerunner 165 Music | fr165m | 5.2 | 390×390 round |
| Forerunner 170 | fr170 | 6.0 | 390×390 round |
| Forerunner 170 Music | fr170m | 6.0 | 390×390 round |
| Forerunner 255 | fr255 | 5.2 | 260×260 round |
| Forerunner 255 Music | fr255m | 5.2 | 260×260 round |
| Forerunner 255s | fr255s | 5.2 | 218×218 round |
| Forerunner 255s Music | fr255sm | 5.2 | 218×218 round |
| Forerunner 265 | fr265 | 5.2 | 416×416 round |
| Forerunner 265s | fr265s | 5.2 | 360×360 round |
| Forerunner 745 | fr745 | 3.3 | 240×240 round |
| Forerunner 955 / Solar | fr955 | 5.2 | 260×260 round |
| Forerunner 965 | fr965 | 5.2 | 454×454 round |

(source: connectiq-compatible-devices-full.md, garmin-speaker-devices-research.md)

### epix series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| epix (Gen 2) / quatix 7 Sapphire | epix2 | 5.2 | 416×416 round |
| epix Pro (Gen 2) 42mm | epix2pro42mm | 5.2 | 360×360 round |
| epix Pro (Gen 2) 47mm / quatix 7 Pro | epix2pro47mm | 5.2 | 416×416 round |
| epix Pro (Gen 2) 51mm | epix2pro51mm | 5.2 | 454×454 round |

(source: connectiq-compatible-devices-full.md)

### Instinct series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| Instinct 2 / Solar / Dual Power | instinct2 | 3.4 | 176×176 round |
| Instinct 2S / Solar / Dual Power | instinct2s | 3.4 | 156×156 round |
| Instinct 2X Solar | instinct2x | 3.4 | 176×176 round |
| Instinct Crossover | instinctcrossover | 3.4 | 176×176 round |
| Instinct Crossover AMOLED | instinctcrossoveramoled | 5.1 | 240×240 round |
| Instinct 3 AMOLED 45mm | instinct3amoled45mm | 5.1 | 390×390 round |
| Instinct 3 AMOLED 50mm | instinct3amoled50mm | 5.1 | 416×416 round |
| Instinct 3 Solar 45mm / 50mm | instinct3solar | 5.1 | 176×176 round |
| Instinct E 40mm | instincte40mm | 5.1 | 176×176 round |
| Instinct E 45mm | instincte45mm | 5.1 | 176×176 round |

(source: connectiq-compatible-devices-full.md, garmin-speaker-devices-research.md)

### Venu / vívoactive series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| Venu | venu | 3.3 | 390×390 round |
| Venu 2 | venu2 | 5.0 | 416×416 round |
| Venu 2S | venu2s | 5.0 | 360×360 round |
| Venu Sq | venusq | 3.3 | 240×240 square |
| Venu Sq Music | venusqm | 3.3 | 240×240 square |
| Venu Sq 2 | venusq2 | 5.0 | 320×360 rect |
| Venu Sq 2 Music | venusq2m | 5.0 | 320×360 rect |
| vívoactive 3 | vivoactive3 | 3.1 | 240×240 round |
| vívoactive 3 Music | vivoactive3m | 3.2 | 240×240 round |
| vívoactive 3 Music LTE | vivoactive3mlte | 3.1 | 240×240 round |
| vívoactive 4 | vivoactive4 | 3.3 | 260×260 round |
| vívoactive 4S | vivoactive4s | 3.3 | 218×218 round |
| vívoactive 5 | vivoactive5 | 5.2 | 390×390 round |
| vívoactive 6 | vivoactive6 | 6.0 | 390×390 round |

(source: connectiq-compatible-devices-full.md, garmin-speaker-devices-research.md)

### MARQ series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| MARQ Adventurer | marqadventurer | 3.4 | 240×240 round |
| MARQ Athlete | marqathlete | 3.4 | 240×240 round |
| MARQ Aviator | marqaviator | 3.4 | 240×240 round |
| MARQ Captain | marqcaptain | 3.4 | 240×240 round |
| MARQ Commander | marqcommander | 3.4 | 240×240 round |
| MARQ Driver | marqdriver | 3.4 | 240×240 round |
| MARQ Expedition | marqexpedition | 3.4 | 240×240 round |
| MARQ Golfer | marqgolfer | 3.4 | 240×240 round |
| MARQ (Gen 2) | marq2 | 5.2 | 416×416 round |
| MARQ (Gen 2) Aviator | marq2aviator | 5.2 | 416×416 round |

(source: connectiq-compatible-devices-full.md)

### Descent series

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| Descent Mk1 | descentmk1 | 3.1 | 240×240 round |
| Descent Mk2 / Mk2i | descentmk2 | 3.4 | 280×280 round |
| Descent Mk2 S | descentmk2s | 3.4 | 240×240 round |
| Descent G1 / G1 Solar | descentg1 | 3.4 | 176×176 round |
| Descent G2 | descentg2 | 5.1 | 416×416 round |
| Descent Mk3 43mm / Mk3i 43mm | descentmk343mm | 5.1 | 360×360 round |
| Descent Mk3i 51mm | descentmk3i51mm | 5.1 | 416×416 round |

(source: connectiq-compatible-devices-full.md)

### Other watches

| Device | Product ID | API | Screen |
|--------|-----------|-----|--------|
| Enduro | enduro | 3.4 | 280×280 round |
| Enduro 3 | enduro3 | 6.0 | 280×280 round |
| D2 Delta | d2delta | 3.1 | 240×240 round |
| D2 Delta PX | d2deltapx | 3.1 | 240×240 round |
| D2 Delta S | d2deltas | 3.1 | 218×218 round |
| D2 Air X10 | d2airx10 | 5.0 | 416×416 round |
| D2 Mach 1 | d2mach1 | 5.2 | 416×416 round |
| D2 Mach 2 | d2mach2 | 5.2 | 454×454 round |
| Approach S50 | approachs50 | 5.1 | 390×390 round |
| Approach S70 42mm | approachs7042mm | 5.1 | 360×360 round |
| Approach S70 47mm | approachs7047mm | 5.1 | 416×416 round |
| Captain Marvel | legacyherocaptainmarvel | 3.3 | 240×240 round |
| First Avenger | legacyherofirstavenger | 3.3 | 240×240 round |
| Darth Vader | legacysagadarthvader | 3.3 | 260×260 round |
| Rey | legacysagarey | 3.3 | 240×240 round |

(source: connectiq-compatible-devices-full.md, garmin-speaker-devices-research.md)

## Speaker devices to EXCLUDE

These devices are listed in the ToneProfile API docs but have speakers
instead of beepers. Custom ToneProfile calls are silently ignored.

| Device | Product ID | API | Reason |
|--------|-----------|-----|--------|
| Venu 2 Plus | venu2plus | 5.0 | First Garmin watch with speaker (2022) |
| Venu 3 | venu3 | 5.2 | Speaker |
| Venu 3S | venu3s | 5.2 | Speaker |
| Venu 4 41mm | venu441mm | 6.0 | Speaker |
| Venu 4 45mm | venu445mm | 6.0 | Speaker |
| Venu X1 | venux1 | 6.0 | Speaker |
| fēnix 8 43mm | fenix843mm | 6.0 | Speaker |
| fēnix 8 47mm/51mm | fenix847mm | 6.0 | Speaker |
| fēnix 8 Pro | fenix8pro | 6.0 | Speaker |
| fēnix 8 Solar 47mm | fenix8solar47mm | 6.0 | Speaker |
| fēnix 8 Solar 51mm | fenix8solar51mm | 6.0 | Speaker |
| Forerunner 570 42mm | fr57042mm | 6.0 | Speaker |
| Forerunner 570 47mm | fr57047mm | 6.0 | Speaker |
| Forerunner 970 | fr970 | 6.0 | Speaker |
| D2 Mach 2 Pro | d2mach2pro | 6.0 | Speaker (same platform as fēnix 8) |

(source: garmin-speaker-devices-research.md, forum-fenix8-toneprofile-bug.md)

## How to add devices

Add `<iq:product id="..."/>` entries to `manifest.xml`:

```xml
<iq:products>
    <iq:product id="fr245m"/>
    <iq:product id="fenix7"/>
    <iq:product id="fr965"/>
    <!-- ... -->
</iq:products>
```

The `minSdkVersion="3.1.0"` is already correct for ToneProfile.

(source: github-lidar-theremin-manifest.md)

## Screen size considerations

The app currently targets 240×240 round. Different devices have different
screen sizes (176×176 to 454×454) and shapes (round, square, rectangular).
The app may need per-device resource directories for layouts, or it may
work with a single layout if drawing is done programmatically with
relative coordinates.

## Runtime guards

The app should check `if (Attention has :ToneProfile)` before calling
`playTone` with custom tones. This doesn't distinguish beeper from
speaker, but it prevents crashes on devices that lack tone support
entirely.

(source: connectiq-toneprofile-supported-devices-2026.md)

## Uncertainty

Product IDs in the tables above are inferred from Garmin naming
conventions and the lidar-theremin manifest. Garmin does not publish a
master list of product ID strings. The VS Code extension's "Monkey C: Set
Products by Version" command can generate the correct product list for a
given minSdkVersion.

Screen sizes for devices other than the FR245M are approximate and should
be verified against the SDK's device simulator profiles before building.

See also: [[beeper-vs-speaker]], [[toneprofile-api]], [[fr245m-device]],
[[lidar-theremin]]
