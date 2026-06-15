# VibraTest (Developer Tool)

A third-party Connect IQ developer tool for testing vibration and tone
profiles. Useful as a reference for [[toneprofile-api]] usage patterns.

## Source

- Repository: https://github.com/flocsy/VibraTest
- Connect IQ Store: https://apps.garmin.com/en-US/apps/22afbc10-e91b-4de7-a42d-05e8678728c8
- License: GPL-3.0

(source: github-vibratest-overview.md)

## How It Works

Users enter tone profiles as comma/semicolon-delimited strings in the
Connect IQ companion app settings:

    "2500,250;5000,250"

→ `new Attention.ToneProfile(2500, 250), new Attention.ToneProfile(5000, 250)`

(source: github-vibratest-overview.md, forum-vibe-tone-profile-test.md)

## Code Patterns

The source demonstrates several patterns relevant to this project
(source: github-vibratest-app.md):

### Capability guard

```monkeyc
if (Attention has :ToneProfile && Attention has :playTone) { ... }
```

### Playing a custom tone profile

```monkeyc
var toneProfile = [] as Array<ToneProfile>;
toneProfile.add(new Attention.ToneProfile(freq, duration));
Attention.playTone({:toneProfile => toneProfile});
```

### Playing a built-in tone

```monkeyc
Attention.playTone(tone as Attention.Tone);
```

### Build annotations for conditional compilation

```monkeyc
(:tone_profile)
hidden function onSettingsChangedToneProfile() as Void { ... }
(:no_tone_profile)
hidden function onSettingsChangedToneProfile() as Void {}
```

## FR245M Compatibility

The manifest lists `fr245m` among 167+ supported devices. App type is
`watch-app`. Minimum API level is 1.2.0. No special permissions required for
tone playback. (source: github-vibratest-overview.md)

See also: [[lidar-theremin]], [[toneprofile-api]], [[attention-api]]
