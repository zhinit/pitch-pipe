# WatchUi Module Constants

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi.html
Fetched: 2026-06-14

## Key Constants (KEY_*)

| Constant        | Value | Description          |
|-----------------|-------|----------------------|
| KEY_POWER       | 0     | The power key        |
| KEY_LIGHT       | 1     | The light key        |
| KEY_ZIN         | 2     | The zoom in key      |
| KEY_ZOUT        | 3     | The zoom out key     |
| KEY_ENTER       | 4     | The enter key        |
| KEY_ESC         | 5     | The escape key       |
| KEY_FIND        | 6     | The find key         |
| KEY_MENU        | 7     | The menu key         |
| KEY_DOWN        | 8     | The down key         |
| KEY_DOWN_LEFT   | 9     | The down left key    |
| KEY_DOWN_RIGHT  | 10    | The down right key   |
| KEY_LEFT        | 11    | The left key         |
| KEY_RIGHT       | 12    | The right key        |
| KEY_UP          | 13    | The up key           |
| KEY_UP_LEFT     | 14    | The up-left key      |
| KEY_UP_RIGHT    | 15    | The up-right key     |
| KEY_PAGE        | 17    | The page key         |
| KEY_START       | 18    | The start key        |
| KEY_LAP         | 19    | The lap key          |
| KEY_RESET       | 20    | The reset key        |
| KEY_SPORT       | 21    | The sport key        |
| KEY_CLOCK       | 22    | The clock key        |
| KEY_MODE        | 23    | The mode key         |
| KEY_ACTION_MENU | 24    | The action menu key  |

## Click Type Constants (CLICK_TYPE_*)

| Constant           | Value | Description                       |
|--------------------|-------|-----------------------------------|
| CLICK_TYPE_TAP     | 0     | A tap on the screen               |
| CLICK_TYPE_HOLD    | 1     | A press and hold on the screen    |
| CLICK_TYPE_RELEASE | 2     | A release of a hold on the screen |

## Swipe Direction Constants (SWIPE_*)

| Constant   | Value | Description                        |
|------------|-------|------------------------------------|
| SWIPE_UP   | 0     | A swipe in the upward direction    |
| SWIPE_RIGHT| 1     | A swipe towards the right          |
| SWIPE_DOWN | 2     | A swipe in the downward direction  |
| SWIPE_LEFT | 3     | A swipe towards the left           |

## View Transition Constants (SLIDE_*)

| Constant        | Value | Description            |
|-----------------|-------|------------------------|
| SLIDE_IMMEDIATE | 0     | No transition          |
| SLIDE_LEFT      | 1     | View slides to left    |
| SLIDE_RIGHT     | 2     | View slides to right   |
| SLIDE_DOWN      | 3     | View slides down       |
| SLIDE_UP        | 4     | View slides up         |
| SLIDE_BLINK     | 5     | View fades in          |

## View Navigation Methods

**pushView(view, delegate, transition)** — Adds a view to the stack with
specified transition. Throws exception if called from background, data field,
glance, or watch face contexts.

**popView(transition)** — Removes current view with specified transition.

**switchToView(view, delegate, transition)** — Removes current view and adds a
new one simultaneously with transition effect.

**requestUpdate()** — Requests the top-most view be refreshed (triggers onUpdate).
