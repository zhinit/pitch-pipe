# InputDelegate API (Toybox.WatchUi.InputDelegate)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/InputDelegate.html
Fetched: 2026-06-14

## Class Hierarchy

```
Toybox.Lang.Object
└── Toybox.WatchUi.InputDelegate
    └── Toybox.WatchUi.BehaviorDelegate
```

## Overview

InputDelegate processes four categories of user interactions: physical button
presses (KeyEvent), screen touches (ClickEvent), screen swipes (SwipeEvent),
and selectable component state changes (SelectableEvent).

## Physical Button Methods

**onKey(keyEvent as WatchUi.KeyEvent) → Lang.Boolean**
- Triggered when a physical button is pressed and released
- Use `KeyEvent.getKey()` to retrieve the button identifier
- Returns `true` if the event is handled, `false` otherwise
- Available since API Level 1.0.0

**onKeyPressed(keyEvent as WatchUi.KeyEvent) → Lang.Boolean**
- Triggered when a physical button transitions to pressed state
- Use `KeyEvent.getKey()` to identify which button
- Returns handling status (boolean)
- Available since API Level 1.1.2

**onKeyReleased(keyEvent as WatchUi.KeyEvent) → Lang.Boolean**
- Triggered when a physical button is released
- Query button identity via `KeyEvent.getKey()`
- Returns `true` if handled
- Available since API Level 1.1.2

## Touch Methods

**onTap(clickEvent as WatchUi.ClickEvent) → Lang.Boolean**
- Rapid screen contact followed by release
- Available since API Level 1.0.0

**onHold(clickEvent as WatchUi.ClickEvent) → Lang.Boolean**
- Screen contact maintained without release
- Available since API Level 1.0.0

**onRelease(clickEvent as WatchUi.ClickEvent) → Lang.Boolean**
- Fires only after `onHold()`, when contact ends
- Available since API Level 1.0.0

**onSwipe(swipeEvent as WatchUi.SwipeEvent) → Lang.Boolean**
- Screen contact with directional motion
- Available since API Level 1.0.0

**onDrag(dragEvent as WatchUi.DragEvent) → Lang.Boolean**
- Sustained screen contact with movement
- Available since API Level 3.3.0

**onFlick(flickEvent as WatchUi.FlickEvent) → Lang.Boolean**
- Quick screen movement gesture
- Available since API Level 3.3.0

**onSelectable(selectableEvent as WatchUi.SelectableEvent) → Lang.Boolean**
- Responds to state changes in Selectable UI components
- Available since API Level 2.1.0

## Code Example

```monkeyc
using Toybox.System;
using Toybox.WatchUi;

class MyInputDelegate extends WatchUi.InputDelegate {
    function onKey(keyEvent) {
        System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
        return true;
    }

    function onTap(clickEvent) {
        System.println(clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return true;
    }

    function onSwipe(swipeEvent) {
        System.println(swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
        return true;
    }
}
```

## Supported Contexts

Audio Content Provider, Data Field, Glance, Watch App, Watch Face, Widget.
