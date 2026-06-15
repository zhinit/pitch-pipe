# Attention API (Toybox.Attention)

The Attention module controls audio alerts, vibration, backlight, and flashlight
on Garmin devices.

## playTone

```monkeyc
playTone(options as Attention.Tone or {
  :toneProfile as Lang.Array<Attention.ToneProfile>,
  :repeatCount as Lang.Number
}) as Void
```

Two calling conventions (source: connectiq-attention-api.md):

1. **Predefined tone**: `Attention.playTone(Attention.TONE_LOUD_BEEP)`
2. **Custom tone sequence**: pass a dictionary with `:toneProfile` (array of
   [[toneprofile-api]] objects) and optional `:repeatCount`

## Predefined Tone Constants

19 built-in tones, from TONE_KEY (0) to TONE_ERROR (18). These are the only
tones available on speaker-based devices. On beeper devices they produce
characteristic electronic sounds. (source: connectiq-attention-api.md)

## Device Capability Check

Not all devices support tones. The recommended guard:

```monkeyc
if (Attention has :playTone) {
    Attention.playTone(Attention.TONE_LOUD_BEEP);
}
```

(source: connectiq-attention-api.md)

## vibrate

```monkeyc
vibrate(vibeProfiles as Array<VibeProfile>) as Void
```

1–8 VibeProfile objects, each with intensity (0–100) and duration (ms).
(source: connectiq-attention-api.md)

## Supported App Types

Watch apps, widgets, glances, data fields, audio content providers.
(source: connectiq-attention-api.md)

## System Setting Dependency

`playTone()` silently does nothing if the user has Alert Tones disabled in
device settings. Apps cannot override this. Check
`System.getDeviceSettings().tonesOn` to detect the state.
(source: forum-ciq-ignore-devicesettings-tones.md)

See also: [[toneprofile-api]], [[beeper-vs-speaker]], [[fr245m-device]],
[[device-tone-setting]]
