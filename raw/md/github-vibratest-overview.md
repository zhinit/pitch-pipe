# VibraTest — Repository Overview

Source: https://github.com/flocsy/VibraTest
Fetched: 2026-06-14
Author: flocsy
License: GPL-3.0

## Purpose

VibraTest is a Garmin Connect IQ developer tool for testing vibration and tone
profiles on smartwatches. It lets developers edit and try how VibeProfile feels
and how ToneProfile and built-in tones sound.

## Tone Testing

Tone profiles are entered as comma/semicolon-delimited strings via the
Connect IQ settings app:

    "2500,250;5000,250"

is equivalent to:

    new Attention.ToneProfile(2500, 250),
    new Attention.ToneProfile(5000, 250)

The app can also play built-in predefined tones by number (TONE_START, etc.).

## Project Structure

```
├── .vscode/
├── features/
├── images/
├── resources/
├── source/
│   ├── Config.mc
│   ├── VibraTestApp.mc
│   └── VibraTestView.mc
├── manifest.xml
├── monkey.jungle
├── README.md
└── LICENSE
```

## Device Support

- App type: watch-app
- fr245m is listed in the manifest
- Supports 167+ Garmin devices
- Minimum API level: 1.2.0
- No special permissions required for tone playback
