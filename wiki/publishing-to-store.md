# Publishing to the Connect IQ Store

How to get the pitch pipe app into the Garmin Connect IQ Store so anyone
can install it.

## Prerequisites

1. **Developer account** — register (free) at
   https://www.garmin.com/en-US/forms/ciq-registration/
   (source: connectiq-store-submission.md)

2. **Store assets** — required before submission:
   - App icon: 500×500 px, sRGB, solid non-black background, no text
   - On-device icon: 128×128 px, two versions (64-color for MIP displays,
     24-bit for AMOLED)
   - Hero image: 1440×720 px (optional but recommended)
   - Screenshots from the simulator
   - Description text
   (source: connectiq-store-assets.md)

3. **Launcher icon** — the in-app icon sizes vary by device (36×36 to
   65×65). The current 40×40 icon works but gets scaled. For best results,
   provide a higher-resolution source and let the build system scale down.
   (source: connectiq-store-assets.md)

## Building the store package

The `-e` flag builds for all devices in the manifest and packages them
into a single `.iq` file:

```
monkeyc -e -f monkey.jungle -o bin/pitch-pipe.iq -y developer_key.der -w -r
```

This compiles once per device variant (185 builds for the current
manifest) and produces a single `.iq` file. Devices that don't meet
`minSdkVersion` are skipped automatically.

(source: connectiq-monkeyc-cli-export.md)

## Submission process

1. Upload the `.iq` file at https://apps.garmin.com/en-US/developer/upload
2. Garmin validates the binary
3. Add description, screenshots, and category metadata
4. Garmin reviews the app (not publicly visible during review)
5. You can preview and test your own app during review
6. Upon approval, Garmin notifies you and the app goes live

(source: connectiq-store-submission.md)

## Review timeline

- App updates: typically a couple of hours
- New apps: typically a couple of business days
- No ANT+ or special permissions needed for this app, so no extra
  certification steps

(source: connectiq-store-submission.md)

## Store listing recommendations

- Description should explain what the app does and which devices it
  works on
- Note the [[beeper-vs-speaker]] limitation: the app requires a device
  with a tone generator (beeper). Devices with speakers (Fenix 8,
  Venu 3/4, FR570, FR970) are not supported due to hardware limitations
- Take screenshots from the simulator for at least 2–3 screen sizes
  (e.g. 176×176 Instinct, 240×240 FR245M, 416×416 epix)

## What we still need

Before submitting:

1. **500×500 app icon** — current launcher icon is 40×40
2. **128×128 on-device icons** (64-color and 24-bit versions)
3. **Store description text**
4. **Screenshots** from simulator at representative screen sizes
5. **Developer account registration**

See also: [[multi-device-compatibility]], [[connect-iq-platform]]
