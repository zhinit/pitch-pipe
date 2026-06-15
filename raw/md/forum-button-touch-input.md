# Forum: Supporting Both Physical Button and Touch Input

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/365554/supporting-both-physical-button-and-touch-input
Fetched: 2026-06-14

## Key Finding

There is no official mapping table for how BehaviorDelegate methods correspond
to physical buttons across device types. Developers must test empirically.

## Device Input Patterns

### Button-Only Devices (e.g., Forerunner 245)

- Support onSelect(), onBack(), onMenu() callbacks
- Physical buttons map reliably to these methods
- No touch input available

### Touch + Button Devices (e.g., Forerunner 965, 955)

- onSelect() fires from both screen taps and physical SELECT button
- Developers cannot distinguish tap location from button press via onSelect()

### Single-Button Touch Devices (e.g., vivoActive 3)

- Screen tap → onSelect()
- Swipe right → onBack()
- Touch and hold → onMenu()

## Recommended Approach

Rather than relying on onSelect(), implement dual handlers:

> "Implement onTap() and onKey(), but not onSelect()... treat KEY_ENTER and
> KEY_START as the select button."

This enables:
- **onTap()**: Handle screen touches with coordinate awareness
- **onKey()**: Capture physical button presses specifically
- Return `false` for unmapped keys to let BehaviorDelegate process them

## Key Limitation

No programmatic way to disable automatic tap-to-onSelect translation. The
framework maps touches to onSelect() by default on touch devices.
