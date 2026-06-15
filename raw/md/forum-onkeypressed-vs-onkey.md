# Forum: onKeyPressed vs onKey

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/2036/onkeypressed-vs-onkey
Fetched: 2026-06-14

## Key Differences

onKey fires for standard key events (press and release), while onKeyPressed
and onKeyReleased are specifically designed for detecting key press duration.
These events can fire simultaneously — the original poster noted both
triggering together when pressing a key.

## Interaction Between Events

"onKeyPressed() works, but it also triggers onKey() at the same time." Travis
Vitek recommended ignoring onKey events entirely if you want to handle key
holds, instead using onKeyPressed combined with onKeyReleased.

## Recommended Approach for Long Press

1. onKeyPressed: Capture the timestamp when a key is first pressed
2. onKeyReleased: Calculate duration by subtracting the press time
3. Compare duration against a threshold to distinguish short vs. long presses

## Important Caveats

onKeyReleased can fire without a corresponding onKeyPressed if your view is
pushed due to another key event. Use null-checking to guard against this —
Travis noted "this can happen if view/delegate is popped as the result of an
onKey or onKeyPressed event."

Device compatibility was problematic; the approach worked on an F3 but
reportedly failed on a Vivoactive, suggesting hardware-specific limitations.
