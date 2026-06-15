# Timer API (Toybox.Timer.Timer)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Timer/Timer.html
Fetched: 2026-06-14

## Class Hierarchy

```
Toybox.Lang.Object
└── Toybox.Timer.Timer
```

## Overview

The Timer class executes a callback function after a specified delay in
milliseconds. Timers can operate in one-shot mode (execute once) or repeating
mode (execute periodically until stopped).

## Instance Methods

### start(callback, time, repeat)

```monkeyc
start(callback as Lang.Method() as Void,
      time as Lang.Number,
      repeat as Lang.Boolean) as Void
```

- **callback**: Function to invoke when timer expires
- **time**: Milliseconds to elapse before execution (minimum 50ms)
- **repeat**: true = repeating, false = one-shot

Will crash if called from a watch face in low power mode.

### stop()

```monkeyc
stop() as Void
```

Halts timer execution. Necessary only for repeating timers. The timer may be
restarted with another start() call.

## Usage Example

```monkeyc
using Toybox.Timer;
using Toybox.WatchUi;

var myCount = 0;

function timerCallback() {
    myCount += 1;
    WatchUi.requestUpdate();
}

function onLayout(dc) {
    var myTimer = new Timer.Timer();
    myTimer.start(method(:timerCallback), 1000, true);
}
```

## System Constraints

Default 3 available timers; availability varies by device.
