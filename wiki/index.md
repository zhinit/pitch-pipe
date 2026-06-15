# Wiki Index

## Platform & SDK

- [[connect-iq-platform]] — Garmin's app platform: SDK, app types, project structure, publishing
- [[monkey-c]] — Garmin's programming language: syntax, types, classes, modules, annotations, memory management
- [[monkey-types]] — Gradual type system: four check levels, type annotations, typed containers, poly types
- [[simulator]] — Device simulator: VS Code and CLI workflows, capabilities, limitations for tone testing

## Development & Testing

- [[unit-testing]] — Run No Evil framework: (:test) annotation, assertions, building/running tests, mocking
- [[debugging]] — System.println, crash logs, debug annotations, compiler options, side-loading

## Target Device

- [[fr245m-device]] — Forerunner 245 Music specs: CIQ 3.3, 240×240 round, 128 KB, 64 colors, beeper
- [[fr245m-buttons]] — Five physical buttons: LIGHT, UP, DOWN, START/STOP, BACK; key constant mapping

## UI & Input

- [[input-handling]] — BehaviorDelegate vs InputDelegate, button mapping, onKeyPressed unreliability
- [[watchui-constants]] — KEY_*, SLIDE_*, CLICK_TYPE_* constant tables

## App Architecture

- [[view-lifecycle]] — View lifecycle (onLayout→onShow→onUpdate→onHide), Graphics.Dc drawing API, fonts, colors
- [[timer-api]] — Toybox.Timer: start/stop, repeating callbacks, 50ms minimum, 3-timer limit

## Audio APIs

- [[attention-api]] — Toybox.Attention module: playTone, vibrate, backlight, device capability checks
- [[toneprofile-api]] — Custom tones via frequency (Hz) + duration (ms); the core mechanism for a pitch pipe
- [[beeper-vs-speaker]] — Hardware distinction determining whether ToneProfile works; FR245M is a beeper device
- [[tone-sustain]] — playTone behavior: async, second call cancels first, no stop API, timer re-trigger strategy

## Reference Apps

- [[lidar-theremin]] — Official Garmin sample using ToneProfile at 50–4000 Hz; lists fr245m as supported
- [[vibratest]] — Developer tool for testing tone/vibration profiles; complete source code available
- [[existing-audio-apps]] — Survey of Connect IQ apps using audio: no existing pitch pipe found

## Music Theory

- [[concert-pitch-a440]] — A4 = 440 Hz, ISO 16 standard, history, regional variations
- [[equal-temperament]] — 12-TET: semitone ratio 2^(1/12), frequency formula, integer rounding analysis
- [[note-frequency-table]] — Complete C3–C6 frequency table for the pitch pipe; all within ToneProfile range
