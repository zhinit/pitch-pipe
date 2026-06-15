# Forum: Can CIQ Ignore DeviceSettings for Tones / Vibrate?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/195502/can-ciq-ignore-devicesettings-for-tones-vibrate
Fetched: 2026-06-15

## Original Question (Nikeow)

Asked whether Connect IQ apps can override device settings that disable tones
and vibrations. Noted that the API provides `DeviceSettings.TonesOn` and
`DeviceSettings.VibrateOn` to check the state, and questioned if an app could
proceed with playing sounds despite these settings being disabled.

## Verified Answer (Travis.ConnectIQ — Garmin staff)

"You can try to, but the tone/vibrate will not play."

Connect IQ respects system-level preferences and cannot bypass them.

## Follow-up Discussion (Nikeow)

Shared a real-world troubleshooting scenario with their GymTimer app. A Fenix 6
Pro user reported no vibrations, despite the app working on other devices.
Through diagnostic testing (displaying `Sys.getDeviceSettings().vibrateOn` on
screen), discovered the user had vibration disabled in watch settings.

The complication: the user had attempted changing settings through Garmin Connect
Mobile (web interface), which didn't properly sync to the watch. Once they
adjusted settings directly on the device itself, the issue resolved.

## Resolution

Nikeow later updated that Garmin released a firmware update that fixed the
underlying syncing problem for the affected user.

## Key Takeaways

1. Apps cannot override `tonesOn` or `vibrateOn` — the OS enforces these at
   system level.
2. `Sys.getDeviceSettings().tonesOn` is the correct way to check if tones will
   play.
3. Settings changed via Garmin Connect Mobile may not sync to the watch —
   users should configure sound settings directly on the device.
