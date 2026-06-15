# Tone Sustain and Playback Control

How to play, sustain, and stop tones using the [[toneprofile-api]] and
[[attention-api]].

## playTone Behavior

- Calling playTone() is **asynchronous** — execution continues immediately.
  (source: forum-playtone-simultaneous.md)
- Calling playTone() again **cancels** the previous tone — "the second
  playTone call 'wins'. You never hear the first."
  (source: forum-playtone-simultaneous.md)
- A single playTone() call plays a tone for the specified duration and then
  stops. There is no "infinite" mode.
  (source: forum-playtone-beep.md)

## repeatCount

The `:repeatCount` parameter repeats the entire tone array sequence N times:

```monkeyc
Attention.playTone({
    :toneProfile => [new Attention.ToneProfile(440, 250)],
    :repeatCount => 10
});
```

This plays the 250ms tone 10 times in succession (total ~2500ms). The API
documentation does not specify a maximum value for repeatCount.
(source: connectiq-attention-api.md)

## No Stop API

There is no `Attention.stopTone()` or equivalent. Once a tone starts playing,
it plays until its duration expires (or is cancelled by a new playTone call).
(source: forum-playtone-beep.md, forum-playtone-simultaneous.md)

## Strategies for Sustained Tones

### Option A: Timer-based Re-triggering

Play a short tone (e.g. 250ms) and use a repeating Timer to re-trigger it
before it expires. The lidar theremin uses this pattern — it calls
`playTone(freq, 250)` on every sensor callback (~4 Hz).
(source: github-lidar-theremin-controller.md)

```monkeyc
var _toneTimer = new Timer.Timer();

function startTone(freq) {
    _currentFreq = freq;
    playOnce();
    _toneTimer.start(method(:playOnce), 200, true);
}

function playOnce() {
    var tone = new Attention.ToneProfile(_currentFreq, 250);
    Attention.playTone({:toneProfile => [tone]});
}

function stopTone() {
    _toneTimer.stop();
}
```

**Pros**: Tone can be stopped at any time by stopping the timer.
**Cons**: Brief gap or overlap between re-triggers may produce artifacts.
The timer interval should be shorter than the tone duration to avoid gaps
(e.g. 200ms timer, 250ms tone = 50ms overlap where the new tone cancels the
old). (source: connectiq-timer-api.md, github-lidar-theremin-controller.md)

### Option B: Long Duration with repeatCount

Play a single tone with a long duration or high repeatCount:

```monkeyc
Attention.playTone({
    :toneProfile => [new Attention.ToneProfile(440, 5000)],
    :repeatCount => 1
});
```

**Pros**: Simpler; no timer needed; continuous tone without retriggering.
**Cons**: Cannot be stopped early (no stop API). The user would hear the
full 5 seconds even after navigating away. Maximum practical duration is
unknown — no documented limit.

### Option C: Long Duration, Cancel with New Tone

Play a long tone, and "stop" it by playing a minimal-duration tone:

```monkeyc
// Stop by playing a 1ms silent-ish tone
Attention.playTone({
    :toneProfile => [new Attention.ToneProfile(50, 1)]
});
```

This exploits the "second call wins" behavior. Whether a 1ms tone at 50 Hz
is audible on the FR245M beeper is untested.
(source: forum-playtone-simultaneous.md)

## Timer API Reference

```monkeyc
var timer = new Timer.Timer();
timer.start(callback, intervalMs, repeat);  // min 50ms
timer.stop();
```

Default 3 timers available per app. (source: connectiq-timer-api.md)

## Implications for This Project

Since [[input-handling]] shows that onKeyPressed/onKeyReleased are unreliable
on Forerunner devices, a "hold button to sustain" interaction is not feasible.
The pitch pipe should use a **toggle model**: press START/STOP (onSelect) to
start playing, press again to stop.

The recommended approach combines Options A and C:
- Use a repeating Timer to re-trigger the tone while "playing"
- Stop the timer and play a minimal cancel tone on the second press
- This gives reliable start/stop control without depending on key hold events

See also: [[toneprofile-api]], [[attention-api]], [[input-handling]],
[[fr245m-buttons]]
