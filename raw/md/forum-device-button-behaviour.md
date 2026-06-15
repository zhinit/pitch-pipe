# Forum: Documentation Request — Device Button Behaviour

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/3146/documentation-request---device-button-behaviour
Fetched: 2026-06-14

## Original Request

Chris requested documentation mapping physical device buttons to
BehaviorDelegate events across different Garmin devices. He noted that
different devices (Epix, 920XT, Vivoactive) trigger the same events through
different buttons, making multi-device app development confusing.

## Key Issues Identified

- **Epix**: onSelect fires from both touchscreen tap AND Start/Stop button
- **920XT**: onSelect fires from Enter Key
- **Vivoactive**: onSelect fires only from screen tap, not from Enter/Start

## Recommended Approach (Jim M)

Rather than memorizing device-specific mappings:

1. **Common inputs** across all devices: onMenu, onBack, KEY_START
2. **Mapped inputs**: Use KEY_UP/KEY_DOWN or SWIPE events interchangeably
3. **Touch-specific**: Reserve onTap and onHold for touchscreen devices only
4. **Touch detection**: Use `Sys.getDeviceSettings().isTouchScreen`

## Official Response

Brandon from Garmin acknowledged the confusion and committed to creating
"a more explicit button-to-behavior mapping" documentation. He noted inherent
device variance.

## Practical Alternative

Jim suggested using native menus and confirmation dialogs, which "handle the
differences" automatically across devices.

## Technical Reference

Travis noted that the Input sample program and `devices.xml` configuration
file contain device-specific input mappings for simulator testing.
