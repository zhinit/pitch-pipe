# Forum: CIQ PlayTone() Beep

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/4089/ciq-playtone-beep
Fetched: 2026-06-14

## Original Question

DaveBrillhart asked about playing a tone when a metric crosses a threshold in a
custom datafield. The core issue: "The Attention.playTone(XX) function works.
But it starts a never ending tone!"

## Root Cause

The tone wasn't actually endless — it was being triggered repeatedly. As
DaveBrillhart explained: "I was in a once per second loop that hit the
playtone() each time. Thought my logic avoided that. Dumb error."

## Key Findings

- Attention.playTone() plays a single tone when called once
- No built-in stop method exists in the API
- Calling playTone() repeatedly (such as in a compute loop) creates the
  illusion of a continuous tone
- The solution involves logic that triggers the function only once when a
  threshold is crossed, not repeatedly

## Device Compatibility

Forum members confirmed the Attention module functions properly in datafields
on various devices (Edge 520, etc.), though earlier SDK versions had issues
with watch restarts when using vibration features.
