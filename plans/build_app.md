# Build Plan: Pitch Pipe for Garmin FR245M

Target: Connect IQ device app for the Forerunner 245 Music.
Five physical buttons, 240×240 round display, 128 KB memory, beeper hardware.
No physical device available — all testing via simulator + side-loading.

---

## Step 0: Project Scaffold — DONE

Created:

- `manifest.xml` — watch-app, fr245m, minSdkVersion 3.1.0
- `monkey.jungle` — build config
- `source/PitchPipeApp.mc` — AppBase, getInitialView
- `source/PitchPipeView.mc` — View stub
- `source/PitchPipeDelegate.mc` — BehaviorDelegate stub
- `resources/` — strings, drawables, launcher icon placeholder

---

## Step 1: Note Data Model — DONE

Created `source/NoteData.mc` — module with 36 notes (C3–B5), integer
frequencies from wiki/note-frequency-table.md, lookup functions.

Tests: `test/TestNoteData.mc` — 11 tests (frequency values, names, octaves,
display names, count, range, ascending order).

---

## Step 2: Note Selection Logic — DONE

Created `source/NoteSelector.mc` — current index state, next/previous with
wraparound, defaults to A4.

Tests: `test/TestNoteSelector.mc` — 5 tests.

---

## Step 3: Display the Current Note — DONE

Updated `PitchPipeView` to show note name (FONT_LARGE) and frequency
(FONT_SMALL) centered. Shared NoteSelector passed from app to view and
delegate.

---

## Step 4: Button Navigation — DONE

Wired UP (onPreviousPage) and DOWN (onNextPage) to NoteSelector.
WatchUi.requestUpdate() triggers redraw.

---

## Step 5: Tone Playback — DONE

Created `source/TonePlayer.mc`. Current approach: single long tone (30s
duration), cancelled by playing a 1ms/50Hz tone. No timer needed.

Previous approach (timer retrigger every 200ms with 250ms tones) caused
audible dropouts in the simulator.

Tests: `test/TestTonePlayer.mc` — 8 tests.

---

## Step 6: Wire Playback to SELECT — DONE

- onSelect toggles playback at current note's frequency
- UP/DOWN while playing restarts tone at new frequency
- Note name turns blue when playing
- onHide stops playback
- "No tone support" shown if Attention API unavailable

---

## Step 7: UI Polish — DONE

- 12-dot chromatic ring around edge (precomputed trig lookup table)
- Current note dot larger and highlighted (blue when playing, muted red idle)
- Prev/next note hints at top/bottom in FONT_XTINY
- All positions pre-calculated in onLayout()
- Muted red/blue color palette: dusty rose idle, Garmin COLOR_BLUE when
  playing. Custom hex colors snap to nearest of 64 available on the MIP
  display — named constants render more predictably.

---

## Step 8: Edge Cases and Robustness — DONE

- Attention API capability check cached in TonePlayer.initialize()
- play() is no-op without tone support
- stop() safe to call when not playing
- double-stop safe
- play while already playing safe

---

## Step 9: BACK Button / App Exit — RESOLVED (not a bug)

The blue triangle is the simulator's "no app running" screen. It appears for
both crashes and normal exits — there is no visual distinction.
(wiki/simulator-blue-triangle)

Garmin staff recommend not handling onBack on the initial view — let the
system exit the app. Our delegate does not implement onBack. The app
relaunches cleanly after the triangle, confirming it exited normally.
(wiki/app-exit)

Current code: onBack is not implemented in PitchPipeDelegate. The system
handles exit.

---

## Step 10: Simulator Audio — RESOLVED (not a bug)

The simulator does synthesize the correct frequency. It generates a WAV file
at `$TMPDIR/com.garmin.connectiq/GARMIN.wav` — analysis confirmed the
frequency changes when different notes are selected. The "same tone"
perception was due to the simulator's low audio quality (8 kHz, 8-bit mono)
through laptop speakers.

The WAV is always 5 seconds regardless of the ToneProfile duration parameter.
This is a simulator limitation — the 30-second duration in the code should
work on the real device.

Audio dropouts from the timer-retrigger approach were real. Switched to single
long tone to eliminate them.

---

## Step 11: Build for Device — DONE

- Release PRG built with `-O2`: `bin/pitch-pipe-release.prg` (95 KB, under
  128 KB limit)
- README.md created with side-loading instructions for a non-technical user
- PRG committed to repo (bin/ not gitignored) so brother can download from
  GitHub directly

---

## Step 12: Settings (Optional)

- Menu (long-press UP → onMenu)
- Default starting note
- Octave range toggle

---

## Summary of Files

```
manifest.xml
monkey.jungle
.gitignore
README.md
source/
  PitchPipeApp.mc      — AppBase, getInitialView
  PitchPipeView.mc     — View, onLayout, onUpdate (draws UI)
  PitchPipeDelegate.mc — BehaviorDelegate (button handling)
  NoteData.mc          — note names, frequencies, lookup functions
  NoteSelector.mc      — current note state, next/previous with wrap
  TonePlayer.mc        — play/stop/toggle via ToneProfile
test/
  TestNoteData.mc      — frequency and name lookup tests
  TestNoteSelector.mc  — navigation and wraparound tests
  TestTonePlayer.mc    — state management tests
resources/
  strings/strings.xml  — app name
  drawables/           — launcher icon + drawables.xml
bin/
  pitch-pipe.prg       — debug build
  pitch-pipe-release.prg — release build (send this to the watch)
```

## Build Commands

```bash
SDK="$HOME/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.2.0-2026-06-09-92a1605b2"

# Build
java -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true \
  -jar "$SDK/bin/monkeybrains.jar" \
  -o bin/pitch-pipe.prg -w -y developer_key.der \
  -d fr245m -f monkey.jungle

# Build with tests
java -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true \
  -jar "$SDK/bin/monkeybrains.jar" \
  -o bin/pitch-pipe-test.prg -w -y developer_key.der \
  -d fr245m -f monkey.jungle --unit-test

# Launch simulator
"$SDK/bin/connectiq"

# Load app
"$SDK/bin/monkeydo" bin/pitch-pipe.prg fr245m

# Run tests
"$SDK/bin/monkeydo" bin/pitch-pipe-test.prg fr245m /t
```
