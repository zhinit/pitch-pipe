# KeyEvent API (Toybox.WatchUi.KeyEvent)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/KeyEvent.html
Fetched: 2026-06-14

## Class Hierarchy

```
Toybox.Lang.Object
└── Toybox.WatchUi.KeyEvent
```

## Overview

KeyEvent is an object sent to an InputDelegate when a physical button on the
device is pressed.

## Instance Methods

### getKey()

Returns a `WatchUi.Key` value representing which physical button was pressed.

Returns: WatchUi.Key enum value
Since: API Level 1.0.0

### getType()

Returns a `WatchUi.KeyPressType` value indicating the nature of the button
interaction. Example: `PRESS_TYPE_DOWN` (value 0).

Returns: WatchUi.KeyPressType enum value
Since: API Level 1.1.2

## Supported Contexts

Watch Apps, Watch Faces, Widgets, Data Fields, Glances, Audio Content Providers.
API Level 1.0.0+.
