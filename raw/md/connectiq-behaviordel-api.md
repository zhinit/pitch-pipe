# BehaviorDelegate API (Toybox.WatchUi.BehaviorDelegate)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/BehaviorDelegate.html
Fetched: 2026-06-14

## Class Hierarchy

```
Toybox.Lang.Object
└── Toybox.WatchUi.InputDelegate
    └── Toybox.WatchUi.BehaviorDelegate
```

## Overview

BehaviorDelegate manages device-independent input behaviors rather than specific
button presses. This abstraction allows the same behavior to map to different
physical inputs across devices — for example, "next page" might trigger via
swipe on touchscreens but physical buttons on other devices.

When a BehaviorDelegate method returns `true`, the corresponding InputDelegate
method won't execute, preventing duplicate handling.

## Instance Methods

| Method             | Return  | Description                                                        |
|--------------------|---------|--------------------------------------------------------------------|
| `initialize()`     | void    | Constructor                                                        |
| `onActionMenu()`   | Boolean | Triggered when action menu is activated (requires showActionMenu)  |
| `onBack()`         | Boolean | Typically KEY_ESC; SWIPE_RIGHT may map to KEY_ESC on some devices  |
| `onMenu()`         | Boolean | Typically KEY_MENU                                                 |
| `onNextMode()`     | Boolean | Advance mode behavior                                              |
| `onNextPage()`     | Boolean | Typically KEY_DOWN or SWIPE_UP on touchscreens                     |
| `onPreviousMode()` | Boolean | Previous mode behavior                                             |
| `onPreviousPage()` | Boolean | Typically KEY_UP or SWIPE_DOWN on touchscreens                     |
| `onSelect()`       | Boolean | Typically KEY_ENTER or CLICK_TYPE_TAP on touchscreens              |

All methods return `true` if handled, `false` otherwise.

## Code Example

```monkeyc
using Toybox.System;
using Toybox.WatchUi;

class MyBehaviorDelegate extends BehaviorDelegate {
    function onMenu() {
        System.println("Menu behavior triggered");
        return false;
    }

    function onKey(keyEvent) {
        System.println(keyEvent.getKey());
        return true;
    }
}
```

## Supported Contexts

Audio Content Provider, Data Field, Glance, Watch App, Watch Face, Widget.
API Level 1.0.0+ (onActionMenu requires 5.1.1).
