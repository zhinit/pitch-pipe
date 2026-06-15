# Timer API (Toybox.Timer.Timer)

A general-purpose timer for executing callbacks after a delay.

## Constructor

```monkeyc
var timer = new Timer.Timer();
```

(source: connectiq-timer-api.md)

## Methods

### start(callback, time, repeat)

```monkeyc
start(callback as Lang.Method() as Void,
      time as Lang.Number,
      repeat as Lang.Boolean) as Void
```

- **callback**: Function to invoke when timer fires
- **time**: Delay in milliseconds (minimum 50ms)
- **repeat**: `true` for repeating, `false` for one-shot

Will crash if called from a watch face in low power mode.
(source: connectiq-timer-api.md)

### stop()

```monkeyc
stop() as Void
```

Halts a repeating timer. Can be restarted with another start() call.
(source: connectiq-timer-api.md)

## Constraints

- Default 3 timers available per app; varies by device
- Minimum interval: 50ms
- Timer callbacks run in the main thread — keep them short

(source: connectiq-timer-api.md)

## Common Pattern: Periodic UI Update

```monkeyc
var _timer = new Timer.Timer();

function onShow() {
    _timer.start(method(:onTimer), 1000, true);
}

function onTimer() {
    WatchUi.requestUpdate();
}

function onHide() {
    _timer.stop();
}
```

(source: connectiq-timer-api.md)

See also: [[tone-sustain]], [[view-lifecycle]]
