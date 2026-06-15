# Decisions

## 001: App type — watch-app

A watch-app (not widget) because widgets auto-close after inactivity and we
need sustained tone playback.

## 002: Toggle model for play/stop

onKeyPressed/onKeyReleased are unreliable on Forerunner devices
(wiki/input-handling). "Hold to play" is not feasible. Instead: press
START/STOP once to start, press again to stop.

## 003: Single long tone instead of timer retrigger

The wiki/tone-sustain page recommended a repeating timer (200ms interval,
250ms tone). This produced audible dropouts in the simulator. Switched to a
single 30-second ToneProfile, cancelled by playing a 1ms/50Hz tone. No timer
needed. Eliminates dropout artifacts.

Trade-off: if the user leaves the tone playing for 30+ seconds without
interaction, it will stop on its own. Acceptable for a pitch pipe — you don't
need a reference tone for 30 seconds.

## 004: Integer Hz frequencies

ToneProfile takes Lang.Number (integer). Rounding from exact 12-TET values
introduces at most ~2.5 cents error (at C3). Human pitch discrimination is
5–10 cents. Integer rounding is sufficient. (wiki/equal-temperament)

## 005: Note range C3–B5 (36 notes)

Three octaves covering the practical pitch pipe range. All frequencies
(131–988 Hz) fall within the demonstrated ToneProfile range of 50–4000 Hz.
(wiki/note-frequency-table, wiki/lidar-theremin)

## 006: No permissions needed

The lidar-theremin and vibratest reference apps confirm that ToneProfile
playback requires no manifest permissions. Only their sensor access (Ant)
required a permission. (wiki/lidar-theremin, wiki/vibratest)
