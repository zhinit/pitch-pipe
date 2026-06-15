# Fenix 8 — No Sound from App When Using ToneProfile

Source: https://forums.garmin.com/developer/connect-iq/i/bug-reports/fenix-8---no-sound-from-app-when-using-toneprofile
Fetched: 2026-06-14

## The Issue

Users reported that Fenix 8 devices were not playing sounds from apps using
ToneProfile, despite the watch supporting tone functionality. Settings for
alert tones and volume were confirmed to be enabled.

## Garmin's Explanation

According to Brandon.ConnectIQ's response, the root cause relates to hardware
differences:

> "Products used to all have tone generators... When products like Venu 2 Plus
> came along, the hardware switched to a speaker that played pre-recorded
> built-in tones and could no longer play arbitrary tone profiles"

The API's `:hasToneSupport` annotation cannot distinguish between devices with
tone generators versus those with speakers. Garmin stated: "the rule of
thumb... is to expect tone profiles to not work if a device has a speaker. This
will likely include most of the newer products."

## Device Support

- **Works**: Fenix 5X Plus, Epix 2 (older devices with tone generators)
- **Doesn't work**: Fenix 8, Venu 3S, Venu 2 Plus (newer devices with speakers)

Garmin acknowledged this is a limitation requiring API-level improvements.
