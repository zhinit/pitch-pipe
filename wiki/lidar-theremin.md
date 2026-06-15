# Lidar Theremin (Official Garmin Sample)

An official Garmin sample app that plays tones at frequencies determined by
LIDAR distance measurements. The most relevant reference implementation for
this project because it demonstrates [[toneprofile-api]] usage with arbitrary
frequencies on the [[fr245m-device]].

## Source

Repository: https://github.com/garmin/connectiq-apps/tree/master/device-apps/lidar-theremin
(source: github-lidar-theremin-controller.md, github-lidar-theremin-manifest.md)

## How It Plays Tones

The controller maps LIDAR distance to frequency linearly:

```monkeyc
const MAX_FREQ = 4000;
const MIN_FREQ = 50;

public function playTone() {
    var distancePercent = _filteredDistance / MAX_DISTANCE;
    distancePercent = distancePercent > 1 ? 1.0 : distancePercent;
    var freq = distancePercent * (MAX_FREQ - MIN_FREQ) + MIN_FREQ;
    freq = freq.toNumber();

    var tone = new Attention.ToneProfile(freq, 250);
    Attention.playTone({:toneProfile => [tone]});
}
```

(source: github-lidar-theremin-controller.md)

## Frequency Range

Uses 50 Hz to 4000 Hz. Musical pitches for a pitch pipe (A2 = 110 Hz through
A5 = 880 Hz) fall well within this range.
(source: github-lidar-theremin-controller.md)

## FR245M Compatibility

The manifest explicitly lists `fr245m` as a supported product. The app uses
`minSdkVersion="3.1.0"` and app type `watch-app`. No permissions are required
for tone playback (only `Ant` for the LIDAR sensor).
(source: github-lidar-theremin-manifest.md)

## Key Takeaways for This Project

1. ToneProfile with arbitrary frequencies is confirmed to work on the FR245M
   (per Garmin's own manifest)
2. Frequencies down to 50 Hz and up to 4000 Hz are used without issue
3. Tone duration of 250 ms is the default used
4. Single ToneProfile in a one-element array is the simplest invocation
5. No capability guard (`Attention has :playTone`) is used — the sample assumes
   all listed devices support it

See also: [[vibratest]], [[toneprofile-api]], [[fr245m-device]]
