# Build Plan: Pitch Pipe for Garmin FR245M

Target: Connect IQ device app for the Forerunner 245 Music.
Five physical buttons, 240×240 round display, 128 KB memory, beeper hardware.
No physical device available — all testing via simulator + side-loading.

---

## Step 0: Project Scaffold

Create the Connect IQ project structure:

- `manifest.xml` — app type `watch-app`, target `fr245m`, minimum API 3.1.0,
  permissions for Attention (tones)
- `monkey.jungle` — build config
- `source/PitchPipeApp.mc` — AppBase subclass with `getInitialView()`
- `source/PitchPipeView.mc` — empty View (draws "Pitch Pipe" centered)
- `source/PitchPipeDelegate.mc` — empty BehaviorDelegate (onBack exits)
- `resources/` — strings, properties stubs

**Test:** Build succeeds for fr245m. App launches in simulator, shows text,
BACK button exits.

---

## Step 1: Note Data Model

Create `source/NoteData.mc` — a module containing:

- Array of note names: `["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]`
- Array of integer frequencies for each semitone across octaves 3–5
  (C3=131 through B5=988), sourced from `wiki/note-frequency-table.md`
- Functions:
  - `getNoteName(noteIndex)` → String (e.g. "A")
  - `getOctave(noteIndex)` → Number (e.g. 4)
  - `getFrequency(noteIndex)` → Number in Hz (e.g. 440)
  - `getNoteCount()` → total number of notes
  - `getDisplayName(noteIndex)` → String (e.g. "A4")

State tracking (current selected note index) stays out of this module — it
belongs in the view or a separate model.

**Tests:**

```
(:test) getFrequency for A4 returns 440
(:test) getFrequency for C3 returns 131
(:test) getFrequency for B5 returns 988
(:test) getNoteName for index of A4 returns "A"
(:test) getOctave for index of A4 returns 4
(:test) getDisplayName for index of A4 returns "A4"
(:test) getNoteCount returns 36 (C3 through B5)
(:test) all frequencies are in range 50–4000
```

---

## Step 2: Note Selection Logic

Create `source/NoteSelector.mc` — a class that holds:

- `_currentIndex` (Number) — starts at the index for A4 (the natural default)
- `next()` / `previous()` — increment/decrement with wraparound
- `getCurrentIndex()` → Number
- `setIndex(i)` → Void

This is the navigable state that the delegate manipulates and the view reads.

**Tests:**

```
(:test) initial index is A4
(:test) next from B5 wraps to C3
(:test) previous from C3 wraps to B5
(:test) next increments by 1
(:test) previous decrements by 1
```

---

## Step 3: Display the Current Note

Update `PitchPipeView.onUpdate(dc)`:

- Clear screen (black background)
- Draw the note name large and centered (e.g. "A4") using FONT_LARGE or
  FONT_NUMBER_HOT for the octave digit
- Draw the frequency below in smaller text (e.g. "440 Hz")
- Indicate playing state (not yet functional — just the layout)

Pre-calculate text positions in `onLayout()` for performance.

**Test:** Simulator shows "A4" and "440 Hz" centered on the round display.
Manual visual check — no unit test for rendering.

---

## Step 4: Button Navigation (Note Selection)

Wire up `PitchPipeDelegate`:

- `onNextPage()` (DOWN button) → `NoteSelector.next()`, request update
- `onPreviousPage()` (UP button) → `NoteSelector.previous()`, request update
- `onBack()` → exit app (`WatchUi.popView`)

The delegate needs a reference to the NoteSelector instance. Pass it via
constructor.

**Test:** In simulator, UP/DOWN buttons cycle through all 36 notes. Display
updates on each press. Wraparound works at both ends. BACK exits.

Also unit test the delegate→selector wiring if feasible, but this is primarily
a simulator test.

---

## Step 5: Tone Playback (Core Feature)

Create `source/TonePlayer.mc` — a class that manages tone playback:

- `_timer` (Timer.Timer) — for sustain re-triggering
- `_isPlaying` (Boolean)
- `_currentFreq` (Number)
- `play(freq)` — start playing: store freq, play first tone, start repeating
  timer (200ms interval, 250ms tone duration per wiki/tone-sustain)
- `stop()` — stop timer, play a cancel tone (1ms at 50 Hz), set not playing
- `isPlaying()` → Boolean
- `toggle(freq)` — if playing the same freq, stop; otherwise play new freq

Guard with `if (Attention has :playTone)` before any playTone call.

**Tests:**

```
(:test) isPlaying returns false initially
(:test) after play(), isPlaying returns true
(:test) after stop(), isPlaying returns false
(:test) toggle same freq stops playback
(:test) toggle different freq starts new playback
```

Note: actual audio output cannot be unit-tested. The above tests verify state
management. Audio must be verified in simulator (and ultimately on device).

---

## Step 6: Wire Playback to SELECT Button

Update `PitchPipeDelegate`:

- `onSelect()` (START/STOP button) → `TonePlayer.toggle(currentFreq)`
- Handle both KEY_ENTER and KEY_START via onKey() as fallback
- Request display update after toggle

Update `PitchPipeView`:

- Show a visual indicator when playing (e.g. filled circle or different text
  color for the note name)

**Test:** In simulator, press START/STOP to toggle playback. Visual indicator
appears/disappears. Pressing UP/DOWN while playing changes the note and
restarts the tone at the new frequency. Pressing START/STOP again stops.

---

## Step 7: UI Polish

Refine the display for the 240×240 round screen:

- Large note name centered vertically (slightly above center)
- Octave number rendered next to note name
- Frequency in Hz below
- Playing indicator: a small filled circle or "▶" glyph, or invert the
  note name colors
- Ensure text fits within the circular display area (no clipping at edges)
- Use appropriate fonts: FONT_LARGE for note, FONT_MEDIUM for frequency
- Consider a subtle ring or arc to indicate position in the chromatic scale

Keep it simple — the 64-color MIP display and 128 KB memory limit rule out
anything elaborate.

**Test:** Visual review in simulator at 240×240 round. Check that nothing
clips. Verify readability. Cycle through all notes to confirm no layout
issues with wider names (e.g. "G♯5" vs "C3").

---

## Step 8: Edge Cases and Robustness

Handle:

- App suspend/resume: stop tone on `onHide()`, clean up timer
- Memory: verify the app stays well under 128 KB (check simulator memory
  view)
- Attention API absence: graceful degradation if `Attention has :playTone`
  is false (show "No tone support" instead of crashing)
- Timer cleanup in `onHide()` to prevent orphaned callbacks

**Tests:**

```
(:test) TonePlayer.stop is safe to call when not playing (no crash)
(:test) TonePlayer.play is safe to call when already playing (restarts)
(:test) NoteSelector handles repeated next/previous calls without overflow
```

**Simulator test:** Launch app, play tone, press BACK to exit — no crash.
Re-enter app — state is clean.

---

## Step 9: Build for Device

- Build release PRG: `monkeyc` without `--unit-test`, optimized
- Verify file size is reasonable for 128 KB limit
- Document side-loading instructions:
  1. Connect FR245M via USB
  2. Copy `.prg` to `GARMIN/APPS/`
  3. Disconnect, find app in watch menu
- Note known limitations: pitch accuracy unverified on hardware, beeper
  quality unknown

**Test:** Release build succeeds. PRG file size < 128 KB. Side-loading
instructions are clear enough for the brother to follow.

---

## Step 10: Settings (Optional, If Time Permits)

Add a menu (long-press UP → onMenu):

- Default starting note (persisted via Application.Properties)
- Octave range toggle (show octaves 3–5 or just 4)

Only build this if the core app works well. The pitch pipe is useful without
settings.

**Tests:**

```
(:test) default note property loads correctly
(:test) setting persists across app restarts (simulator test)
```

---

## Summary of Files

```
manifest.xml
monkey.jungle
source/
  PitchPipeApp.mc      — AppBase, getInitialView
  PitchPipeView.mc     — View, onLayout, onUpdate (draws UI)
  PitchPipeDelegate.mc — BehaviorDelegate (button handling)
  NoteData.mc          — note names, frequencies, lookup functions
  NoteSelector.mc      — current note state, next/previous with wrap
  TonePlayer.mc        — play/stop/toggle via Timer + ToneProfile
test/
  TestNoteData.mc      — frequency and name lookup tests
  TestNoteSelector.mc  — navigation and wraparound tests
  TestTonePlayer.mc    — state management tests
resources/
  strings.xml          — app name
  properties.xml       — default settings (if step 10)
```

## Constraints to Keep in Mind Throughout

- 128 KB memory — no bitmaps, no custom fonts, minimal resources
- 64 colors — stick to named color constants
- No onKeyPressed/onKeyReleased — toggle model only
- ToneProfile integer Hz — use rounded values from wiki/note-frequency-table
- 3-timer limit — the app uses 1 (tone sustain), leaving 2 spare
- Simulator can't verify pitch accuracy — note this in any handoff
