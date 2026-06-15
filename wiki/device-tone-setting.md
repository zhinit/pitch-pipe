# Device Tone Setting

Connect IQ apps cannot override the device's Alert Tones setting. If the user
has tones disabled, `Attention.playTone()` silently does nothing — no error, no
sound. This is enforced at the OS level.
(source: forum-ciq-ignore-devicesettings-tones.md)

## Checking the setting

```monkeyc
var tonesOn = System.getDeviceSettings().tonesOn;
```

`tonesOn` is a `Boolean`, available since API 1.0.0. Returns `true` if the
device will play tones, `false` if the user has disabled them. A parallel
`vibrateOn` property exists for vibration.
(source: connectiq-devicesettings-api.md)

## FR245M sound settings path

From the watch face: hold UP → System → Sounds → Alert Tones.

Four options in the Sounds menu:
1. Key Tones — sound feedback on button press
2. Alert Tones — system and app alert sounds
3. Vibration — vibration motor on/off
4. Key Vibe — vibration on button press

Alert Tones must be enabled for `playTone()` to produce sound.
(source: fr245-owners-manual-sounds.md)

## Gotcha: Garmin Connect Mobile sync

Settings changed through the Garmin Connect Mobile web interface may not
propagate to the watch. Users should change sound settings directly on the
device. (source: forum-ciq-ignore-devicesettings-tones.md)

## Implications

An app that relies on `playTone()` — like a pitch pipe — should check
`tonesOn` and inform the user if tones are disabled, since the call will
silently fail otherwise.

See also: [[attention-api]], [[fr245m-device]], [[toneprofile-api]]
