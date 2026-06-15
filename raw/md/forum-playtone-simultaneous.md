# Forum: Is There a Way to playTone with Two or More Frequencies at the Same Time?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/289367/is-there-a-way-to-playtone-with-two-or-more-frequencies-at-the-same-time
Fetched: 2026-06-14

## Key Findings

### Calling playTone Multiple Times

"The second playTone call 'wins'. You never hear the first." Subsequent calls
to playTone cancel or override any currently playing tone.

### Async Behavior

playTone operates asynchronously — "as soon as playTone is called, execution
continues, and any subsequent playTone call takes over."

### Array-Based Sequential Tones

Multiple ToneProfile entries in an array play in succession, not
simultaneously. The poster experimented with very short durations (20ms, 10ms,
5ms) to approximate simultaneous playback, noting artifacts and buzzing rather
than clean harmonic blending.

### Technical Limitations

- No threading or parallel execution available in Connect IQ
- No built-in audio mixer for combining frequencies
- Single-frequency playTone only
- One user reported success with 30ms duration between sequential pitches for
  a remote control application
