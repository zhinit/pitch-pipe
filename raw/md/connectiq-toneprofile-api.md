# Class: Toybox.Attention.ToneProfile

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Attention/ToneProfile.html
Fetched: 2026-06-14

The ToneProfile class defines audio tone patterns by specifying frequency and
duration characteristics. Multiple tone profiles can be combined in an array
and passed to the playTone() method to create sequential tone sequences.

## Constructor

```
initialize(aFrequency as Lang.Number, aDuration as Lang.Number)
```

### Parameters

- **aFrequency**: The pitch of the tone measured in hertz (Hz)
- **aDuration**: The length of the tone measured in milliseconds (ms)

## Instance Attributes

| Attribute  | Type        | Description                                   |
|------------|-------------|-----------------------------------------------|
| frequency  | Lang.Number | The frequency of the tone in hertz (Hz)       |
| duration   | Lang.Number | The duration of the tone in milliseconds (ms) |

## Usage Example

```monkeyc
var toneProfile = [
    new Attention.ToneProfile(2500, 250),
    new Attention.ToneProfile(5000, 250),
    new Attention.ToneProfile(10000, 250),
    new Attention.ToneProfile(5000, 250),
    new Attention.ToneProfile(2500, 250),
];
Attention.playTone({:toneProfile=>toneProfile});
```

## Notes

- Available since API Level 3.1.0
- Supported across 100+ Garmin device models
- The documentation does not specify minimum/maximum valid ranges for frequency
  or duration values
