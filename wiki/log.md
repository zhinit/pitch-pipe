# Wiki Log

## 2026-06-14 — Initial research: Connect IQ development for FR245M

Sources archived:

- connectiq-attention-api.md — Toybox.Attention API reference
- connectiq-toneprofile-api.md — ToneProfile class reference
- connectiq-compatible-devices-fr245m.md — FR245M device specs from compatible devices list
- connectiq-sdk-overview.md — SDK version, download, contents
- connectiq-programmers-guide-toc.md — Programmer's guide table of contents
- connectiq-sample-apps-repo.md — Official sample apps repository structure
- forum-playtones-new-devices.md — Beeper vs. speaker device distinction
- forum-fenix8-toneprofile-bug.md — Garmin confirms ToneProfile broken on speaker devices
- forum-simultaneous-tones.md — No multi-frequency playback possible
- forum-fr245-app-memory.md — FR245 app slots and storage capacity
- forum-tones-not-playing-venu2plus.md — ToneProfile fails on Venu 2 Plus hardware
- blog-real-devices-of-connectiq.md — FR245 classified as 128 KB entry-level device
- fr245-owners-manual-sounds.md — Device sound settings
- fr245-owners-manual-specs.md — Battery, connectivity, storage specs

Wiki pages created:

- connect-iq-platform — Platform overview
- monkey-c — Language overview
- fr245m-device — Target device specs and constraints
- attention-api — Attention module reference
- toneprofile-api — ToneProfile API and limitations
- beeper-vs-speaker — Hardware distinction for tone support

## 2026-06-14 — Research: existing audio/tone apps and reference repos

Sources archived:

- github-lidar-theremin-controller.md — Official Garmin sample: ToneProfile at 50–4000 Hz
- github-lidar-theremin-manifest.md — Manifest listing fr245m, minSdkVersion 3.1.0
- github-vibratest-app.md — Complete VibraTest source: ToneProfile parsing and playback
- github-vibratest-overview.md — VibraTest repo structure and device support
- forum-vibe-tone-profile-test.md — VibraTest showcase with usage examples
- fr245-owners-manual-metronome.md — Built-in metronome confirms FR245M has tone generator
- awesome-garmin-audio-apps.md — Survey of audio/timer apps from awesome-garmin list

Wiki pages created:

- lidar-theremin — Official Garmin sample using ToneProfile with arbitrary frequencies
- vibratest — Developer tool with complete source code for tone testing
- existing-audio-apps — Survey of audio/tone apps; no pitch pipe exists

Wiki pages updated:

- fr245m-device — Added metronome and Lidar Theremin evidence for beeper hardware
- index — Added Reference Apps section

## 2026-06-14 — Research: equal temperament and concert pitch A440

Sources archived:

- wikipedia-piano-key-frequencies.md — Complete 88-key frequency table, formula f(n)=2^((n-49)/12)×440
- wikipedia-a440-pitch-standard.md — A440 definition, ISO 16, history, regional variations
- wikipedia-equal-temperament.md — 12-TET definition, semitone ratio, frequency formula
- muted-io-note-frequencies.md — Full 9-octave frequency chart (cross-reference)

Wiki pages created:

- concert-pitch-a440 — A4=440 Hz standard, ISO 16, variations
- equal-temperament — 12-TET math, integer rounding analysis for ToneProfile
- note-frequency-table — C3–C6 frequencies with integer-rounded values for the pitch pipe

Wiki pages updated:

- index — Added Music Theory section

## 2026-06-14 — Research: Connect IQ simulator and development testing

Sources archived:

- forum-simulator-how-to-run.md — Running apps in the simulator, troubleshooting crashes
- forum-simulator-feature-request.md — Simulator limitations: memory, sensors, BLE, automation
- forum-playtones-new-devices.md — Updated with simulator ToneProfile emulation note
- blog-connectiq-getting-started-vscode.md — Full VS Code development workflow walkthrough
- blog-connectiq-commandline-simulator.md — CLI build and simulator commands

Wiki pages created:

- simulator — Device simulator overview, VS Code and CLI workflows, what it can/cannot test

Wiki pages updated:

- index — Added simulator to Platform & SDK section

## 2026-06-14 — Research: Monkey C language, SDK, and testing

Sources archived:

- connectiq-toybox-test-api.md — Toybox.Test module: assert methods, Logger, API level
- forum-how-to-execute-unit-tests.md — Running unit tests, macOS issues, test placement patterns
- forum-unit-test-example.md — Global test functions, CLI build with --unit-test flag
- forum-new-developer-faq.md — Developer FAQ: println debugging, crash logs, side-loading, settings
- medium-monkey-c-fundamentals.md — Monkey C basics: types, syntax, OOP, duck typing
- medium-monkey-c-next-steps.md — Arrays, error handling, modules, callbacks, reference counting
- github-logmonkey-tests.md — Official Garmin test file: manual mocking pattern, typed assertions
- forum-garbage-collection.md — Reference counting, circular references, automatic deallocation
- forum-remove-logging-release.md — :debug/:release annotations, excludeAnnotations, stacking syntax
- blog-optimal-monkey-c.md — New compiler: optimization levels, gradual typing default, IR architecture
- blog-weak-references-monkey-c.md — Weak references solve circular reference problem since v1.2.x
- forum-monkey-c-grammar.md — self/me keywords, numeric types, static, ternary, statement grammar
- blog-road-to-strict-typing.md — Monkey Types: four check levels, as keyword, typed containers, poly types
- forum-debugging-println.md — println troubleshooting in Eclipse (unresolved IDE issue)

Wiki pages created:

- unit-testing — Run No Evil framework, assertions, build/run commands, mocking, limitations
- debugging — println, crash logs, debug annotations, compiler options, side-loading
- monkey-types — Gradual type system, check levels, annotation syntax, typed containers

Wiki pages updated:

- monkey-c — Expanded with numeric types, self/me, classes, modules, containers, callbacks, annotations, memory management, compiler flags
- index — Added Development & Testing section, monkey-types entry

## 2026-06-14 — Research: input handling, view lifecycle, tone sustain

Sources archived:

- connectiq-behaviordel-api.md — BehaviorDelegate class: methods, behavior-to-button mapping
- connectiq-inputdel-api.md — InputDelegate class: onKey, onKeyPressed, onKeyReleased, touch methods
- connectiq-keyevent-api.md — KeyEvent class: getKey(), getType()
- connectiq-watchui-constants.md — KEY_*, CLICK_TYPE_*, SWIPE_*, SLIDE_* constants
- connectiq-view-api.md — View class: lifecycle methods, layout management
- connectiq-graphics-dc-api.md — Graphics.Dc class: all drawing, fill, color, text methods
- connectiq-graphics-constants.md — FONT_*, COLOR_*, TEXT_JUSTIFY_*, ARC_* constants
- connectiq-appbase-api.md — AppBase class: getInitialView(), lifecycle callbacks
- connectiq-timer-api.md — Timer class: start(callback, time, repeat), stop()
- fr245-owners-manual-buttons.md — FR245M five-button layout: LIGHT, UP, DOWN, START/STOP, BACK
- forum-device-button-behaviour.md — No official button-to-behavior mapping; Garmin acknowledged gap
- forum-button-touch-input.md — BehaviorDelegate patterns for button-only vs touch devices
- forum-playtone-beep.md — playTone plays once per call; "never-ending" was repeated triggering
- forum-playtone-simultaneous.md — Second playTone cancels the first; async; no mixer
- forum-onkeypressed-fr230-235-735.md — onKeyPressed/onKeyReleased broken on FR230/235/735
- forum-onkeypressed-vs-onkey.md — onKeyPressed fires alongside onKey; long-press via timestamp
- forum-key-start-vs-enter.md — KEY_START vs KEY_ENTER inconsistency on FR630
- blog-improve-app-performance.md — View lifecycle, onUpdate performance, pre-calculate in onLayout
- github-lidar-theremin-view.md — Official sample: View lifecycle, layout, requestUpdate pattern
- github-lidar-theremin-delegate.md — Official sample: minimal BehaviorDelegate

Wiki pages created:

- fr245m-buttons — Physical button layout and key constant mapping
- input-handling — BehaviorDelegate vs InputDelegate, onKeyPressed unreliability, recommended approach
- watchui-constants — Full KEY_*, SLIDE_* constant tables
- view-lifecycle — View lifecycle, Graphics.Dc drawing API, fonts, colors, performance
- tone-sustain — playTone behavior, repeatCount, timer re-trigger strategy, no stop API
- timer-api — Timer class reference, constraints, common patterns

Wiki pages updated:

- index — Added UI & Input, App Architecture sections

## 2026-06-15 — Research: simulator blue triangle and BACK button exit

Sources archived:

- forum-simulator-blue-triangle.md — Blue triangle means "no app running" (crash or normal exit)
- forum-onback-exit-app.md — Garmin staff: return false or don't implement onBack on initial view
- forum-simulator-button-terminate.md — Known simulator bug: button presses terminate apps in some SDK versions
- forum-simulator-logs.md — No simulator log files; use VS Code Output panel or terminal exit codes

Wiki pages created:

- simulator-blue-triangle — What the blue triangle means, how to distinguish crash from exit
- app-exit — Correct BACK button handling for watch-apps and widgets

Wiki pages updated:

- index — Added simulator-blue-triangle and app-exit entries

## 2026-06-15 — Research: simulator ToneProfile frequency handling

Sources archived:

- forum-simulator-tone-wav.md — Simulator generates GARMIN.wav from ToneProfile; 8kHz/8-bit; does synthesize requested frequency

Local analysis confirmed the simulator does generate correct frequencies in
the WAV file. The "same tone" perception is due to low audio quality (8 kHz
sample rate, 8-bit depth) through laptop speakers. WAV duration is fixed at
5 seconds regardless of ToneProfile duration parameter.

Wiki pages updated:

- simulator — Updated ToneProfile section with WAV file details and quality info
