# Connect IQ Simulator

The Connect IQ SDK includes a device simulator for testing apps during
development. It renders a visual representation of the target device and
supports button clicks, touchscreen taps and swipes via the mouse.
(source: forum-simulator-how-to-run.md)

## Running from VS Code

The primary workflow uses the Monkey C extension:

1. Open Command Palette → **Monkey C: Run App**
2. Select the target device
3. The simulator launches and loads the app

If the simulator shows only a Garmin icon or a blue triangle, the app has
crashed — check the Output view (not Terminal) in VS Code and select the app
from the output dropdown. (source: forum-simulator-how-to-run.md)

**Monkey C: Verify Installation** confirms the SDK and developer key are
configured correctly. (source: forum-simulator-how-to-run.md)

## Running from the command line

Build:

```
java -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true \
  -jar <SDK>/bin/monkeybrains.jar \
  -o output.prg -w -y <developer-key> \
  -d <device-name> -f monkey.jungle
```

Launch the simulator, then load the app:

```
<SDK>/bin/simulator        # or connectiq
<SDK>/bin/monkeydo output.prg <device-name>
```

"File → Kill Device" stops the running app without closing the simulator.
(source: blog-connectiq-commandline-simulator.md)

## What the simulator can test

- **UI and layout** — renders the device screen at the correct resolution and
  shape (round/rectangle). Supports backlight and low-battery states.
  (source: blog-connectiq-getting-started-vscode.md)
- **Button and touch input** — click device buttons or tap/swipe the screen
  with the mouse. (source: forum-simulator-how-to-run.md)
- **App lifecycle** — launch, exit, crash detection.
- **BLE** — bonded connection support added in SDK 9.2.0.
  (source: forum-simulator-feature-request.md)

## What the simulator cannot test accurately

- **ToneProfile audio** — the simulator synthesizes tones into a WAV file
  (`$TMPDIR/com.garmin.connectiq/GARMIN.wav`) at 8 kHz / 8-bit mono. It does
  generate the requested frequency, but the low sample rate and bit depth
  produce poor quality. The WAV is always 5 seconds regardless of the
  ToneProfile duration parameter. Developers report "it sounds much better on
  the watch than in the simulator."
  (source: forum-simulator-tone-wav.md, forum-playtones-new-devices.md)
- **Memory limits** — apps run with more available memory than on real
  hardware; an app that works in the simulator may fail on the device.
  (source: forum-simulator-feature-request.md)
- **Sensor data** — accelerometer, gyro, and GPS require manual FIT file
  playback. (source: forum-simulator-feature-request.md)

## Deploying to a physical device

1. Command Palette → **Monkey C: Build for Device** (or `monkeyc` CLI)
2. Connect the watch via USB
3. Copy the `.prg` file to `GARMIN/APPS/` on the device

(source: blog-connectiq-getting-started-vscode.md)

## Implications for this project

The simulator is useful for developing and testing the UI, navigation, and
app logic of the pitch pipe. However, because ToneProfile emulation is
inaccurate, the actual pitch output cannot be validated without the physical
[[fr245m-device]]. The app will need to be side-loaded via USB for audio
testing.

See also: [[connect-iq-platform]], [[toneprofile-api]], [[beeper-vs-speaker]]
