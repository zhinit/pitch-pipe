# Pitch Pipe for Garmin

A pitch pipe app for Garmin watches. It plays reference tones for tuning
instruments or matching pitch. Scroll through notes, press a button, hear the
tone.

Supports 100+ Garmin watches including Forerunner, fēnix, epix, Instinct,
Venu, vívoactive, MARQ, Descent, and Approach series.

<!-- TODO: uncomment when the store listing is live
## Install

Install from the [Connect IQ Store](https://apps.garmin.com/en-US/apps/YOUR_APP_ID).
-->

---

## How to use

The app shows a note name (like **A4**) and its frequency in Hz.

| Button | What it does |
|---|---|
| **UP** (middle left) | Previous note |
| **DOWN** (bottom left) | Next note |
| **START/STOP** (top right) | Play / stop the tone |
| **BACK** (bottom right) | Exit the app |

- 12 notes from **C4** to **B4** (one octave), looping around
- Starts on **A4** (440 Hz), the standard tuning reference
- Note name turns blue while a tone is playing
- The dots around the edge show your position in the 12-note scale
- Changing notes while playing automatically switches the tone

The tone plays for up to 30 seconds, then stops. Press START/STOP to restart.

---

## Compatible devices

The app works on Garmin devices with a **beeper** (tone generator). Newer
devices with a speaker (fēnix 8, Forerunner 570/970, Venu 3/4) are not
supported — Garmin's speaker hardware cannot play custom frequencies.

**Supported watches include:** Forerunner 55/70/165/170/245/255/265/645/745/935/945/955/965,
fēnix 5/5 Plus/6/7/E, epix (Gen 2)/Pro, Instinct 2/3/E, Venu/Venu 2/Sq,
vívoactive 3/4/5/6, MARQ (Gen 1 & 2), Descent, Enduro, Approach, D2, and more.

See the full list in [`manifest.xml`](manifest.xml).

---

## Alert Tones must be enabled

The app uses the watch's beeper via the `Attention.playTone()` API, which is
gated by the system **Alert Tones** setting. If Alert Tones is off, the app
shows **"Enable Alert Tones"** instead of the frequency.

To enable: from the watch face, hold **UP** → **System** → **Sounds** →
**Alert Tones** → turn on.

---

## Building from source

Requires the [Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Build for a specific device:

```
monkeyc -d fr245m -f monkey.jungle -o bin/pitch-pipe.prg -y developer_key.der -w
```

Build the store package (all devices):

```
monkeyc -e -f monkey.jungle -o bin/pitch-pipe.iq -y developer_key.der -w -r
```

---

## Sideloading

If you want to install without the Connect IQ Store:

1. Build the `.prg` for your device (see above)
2. Connect your watch to your computer via USB
3. Copy the `.prg` file to `GARMIN/APPS/` on the watch drive
4. Eject and unplug
