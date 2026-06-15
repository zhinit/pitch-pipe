# Input Handling (WatchUi Delegates)

Connect IQ handles user input through delegate classes paired with views.
Two delegate classes exist: InputDelegate (low-level) and BehaviorDelegate
(high-level, device-independent).

## BehaviorDelegate vs InputDelegate

**BehaviorDelegate** extends InputDelegate and maps physical inputs to abstract
behaviors. The same behavior (e.g. "next page") maps to different physical
inputs across devices — KEY_DOWN on button devices, SWIPE_UP on touchscreens.
(source: connectiq-behaviordel-api.md)

**InputDelegate** handles raw input events: onKey (button press+release),
onTap, onSwipe, etc. (source: connectiq-inputdel-api.md)

When a BehaviorDelegate method returns `true` for an input, the corresponding
InputDelegate method is suppressed. (source: connectiq-behaviordel-api.md)

## BehaviorDelegate Methods

| Method           | Typical Input                    | Since |
|------------------|----------------------------------|-------|
| onSelect()       | KEY_ENTER or screen tap          | 1.0.0 |
| onBack()         | KEY_ESC or SWIPE_RIGHT           | 1.0.0 |
| onMenu()         | KEY_MENU                         | 1.0.0 |
| onNextPage()     | KEY_DOWN or SWIPE_UP             | 1.0.0 |
| onPreviousPage() | KEY_UP or SWIPE_DOWN             | 1.0.0 |
| onNextMode()     | (device-specific)                | 1.0.0 |
| onPreviousMode() | (device-specific)                | 1.0.0 |
| onActionMenu()   | (requires showActionMenu)        | 5.1.1 |

All return Boolean — `true` if handled, `false` to pass through.
(source: connectiq-behaviordel-api.md)

## InputDelegate Key Methods

| Method           | When Called                      | Since |
|------------------|----------------------------------|-------|
| onKey()          | Button pressed and released      | 1.0.0 |
| onKeyPressed()   | Button transitions to pressed    | 1.1.2 |
| onKeyReleased()  | Button released                  | 1.1.2 |

(source: connectiq-inputdel-api.md)

## onKeyPressed / onKeyReleased — Unreliable

**These callbacks do not work on many devices.** Garmin staff (Travis Vitek)
confirmed they fail on FR230, FR235, and FR735 hardware while working in the
simulator:

> "The onKeyPressed() and onKeyReleased() functionality doesn't work, or at
> least doesn't work with many devices, at this point in time."

> "To be safe, you should avoid using onKeyPressed() and onKeyReleased()."

(source: forum-onkeypressed-fr230-235-735.md)

The FR245M is a direct successor to the FR235. Whether onKeyPressed/
onKeyReleased work on it is unknown and cannot be tested without the physical
device. **Do not rely on these callbacks.**
(source: forum-onkeypressed-fr230-235-735.md, forum-onkeypressed-vs-onkey.md)

## View/Delegate Pairing

Views and delegates are paired when pushed onto the view stack:

```monkeyc
WatchUi.pushView(new MyView(), new MyDelegate(), WatchUi.SLIDE_LEFT);
```

The app entry point returns the initial pair:

```monkeyc
function getInitialView() {
    return [new MainView(), new MainDelegate()];
}
```

(source: connectiq-appbase-api.md, connectiq-watchui-constants.md)

## Key Constants

See [[watchui-constants]] for the full list. The most relevant for the
[[fr245m-buttons]]:

- KEY_ENTER (4), KEY_START (18) — START/STOP button
- KEY_ESC (5) — BACK button
- KEY_UP (13), KEY_DOWN (8) — UP/DOWN buttons
- KEY_MENU (7) — long-press UP

(source: connectiq-watchui-constants.md)

## No Official Button Mapping Table

Garmin acknowledged the lack of a formal button-to-behavior mapping table
across devices. Developers must test empirically in the simulator or on
hardware. (source: forum-device-button-behaviour.md, forum-button-touch-input.md)

## Recommended Approach for Button-Only Devices

For the FR245M (button-only, no touchscreen):

1. Use BehaviorDelegate for standard navigation (onSelect, onBack,
   onNextPage, onPreviousPage, onMenu)
2. Use onKey() for any button that needs custom handling beyond behaviors
3. Handle both KEY_ENTER and KEY_START for the START/STOP button
4. Do not use onKeyPressed/onKeyReleased

(source: forum-button-touch-input.md, forum-onkeypressed-fr230-235-735.md)

See also: [[fr245m-buttons]], [[watchui-constants]], [[view-lifecycle]]
