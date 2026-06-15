# Module: Toybox.Attention

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Attention.html
Fetched: 2026-06-14

The Attention module enables control of audio alerts, vibration patterns,
backlight, and flashlight on Garmin devices. Support varies by device model,
so capability checks are recommended before use.

## Methods

### playTone(options)

Plays either predefined tones or custom tone sequences.

```
playTone(options as Attention.Tone or {
  :toneProfile as Lang.Array<Attention.ToneProfile>,
  :repeatCount as Lang.Number
}) as Void
```

Accepts either a tone constant or a dictionary with `:toneProfile` (array of
ToneProfile objects) and `:repeatCount` parameters.

Example: `Attention.playTone(Attention.TONE_LOUD_BEEP)`

Not all devices fully support this module, so `has` checks are recommended. For
example, the vivoactive does not have a tone generator and will trigger an error
if an app attempts to play sounds.

Recommended pattern: `if (Attention has :playTone) { ... }`

### vibrate(vibeProfiles)

Engages the vibration motor using an array of 1–8 VibeProfile objects in
sequence. Each profile specifies intensity (0–100) and duration in
milliseconds.

### backlight(setting)

Controls display backlight via boolean (on/off at system level) or float
(0.0–1.0 for brightness). Respects device timeout settings and may throw
`BacklightOnTooLongException` on devices with burn-in protection.

### setFlashlightMode(mode, options)

Configures flashlight with mode (OFF/ON/STROBE), color, brightness, and strobe
parameters. Returns a FlashlightResult code.

### hasFlashlightColor(color)

Boolean check confirming whether a specific flashlight color is supported.

## Tone Constants

| Constant             | Value | Description                                         |
|----------------------|-------|-----------------------------------------------------|
| TONE_KEY             | 0     | Indicates that a key was pressed                    |
| TONE_START           | 1     | Indicates that an activity has started               |
| TONE_STOP            | 2     | Indicates that an activity has stopped               |
| TONE_MSG             | 3     | Indicates that a message is available                |
| TONE_ALERT_HI        | 4     | An alert ending with a high note                    |
| TONE_ALERT_LO        | 5     | An alert ending with a low note                     |
| TONE_LOUD_BEEP       | 6     | A loud beep                                          |
| TONE_INTERVAL_ALERT  | 7     | Indicates a change in interval                      |
| TONE_ALARM           | 8     | Indicates an alarm has triggered                    |
| TONE_RESET           | 9     | Indicates that the activity was reset               |
| TONE_LAP             | 10    | Indicates that the user has completed a lap         |
| TONE_CANARY          | 11    | An annoying sound to get the users attention        |
| TONE_TIME_ALERT      | 12    | An alert that a time threshold has been met         |
| TONE_DISTANCE_ALERT  | 13    | An alert that a distance threshold has been met     |
| TONE_FAILURE         | 14    | Indicates that the activity was a failure           |
| TONE_SUCCESS         | 15    | Indicates that the activity was a success           |
| TONE_POWER           | 16    | The power on tone                                    |
| TONE_LOW_BATTERY     | 17    | Indicates that the device has low battery power     |
| TONE_ERROR           | 18    | Indicates an error occurred                          |

## Classes

- **ToneProfile**: Defines frequency and duration for custom tones
- **VibeProfile**: Defines intensity and duration for vibration patterns
- **BacklightOnTooLongException**: Thrown when backlight exceeds safe continuous duration

## Supported App Types

Watch apps, widgets, glances, data fields, and audio content providers.
