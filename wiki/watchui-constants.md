# WatchUi Constants

Key constants, click types, swipe directions, and view transitions defined in
the Toybox.WatchUi module.

## Key Constants (KEY_*)

| Constant        | Value | Description          |
|-----------------|-------|----------------------|
| KEY_POWER       | 0     | Power key            |
| KEY_LIGHT       | 1     | Light key            |
| KEY_ZIN         | 2     | Zoom in key          |
| KEY_ZOUT        | 3     | Zoom out key         |
| KEY_ENTER       | 4     | Enter key            |
| KEY_ESC         | 5     | Escape key           |
| KEY_FIND        | 6     | Find key             |
| KEY_MENU        | 7     | Menu key             |
| KEY_DOWN        | 8     | Down key             |
| KEY_DOWN_LEFT   | 9     | Down left key        |
| KEY_DOWN_RIGHT  | 10    | Down right key       |
| KEY_LEFT        | 11    | Left key             |
| KEY_RIGHT       | 12    | Right key            |
| KEY_UP          | 13    | Up key               |
| KEY_UP_LEFT     | 14    | Up-left key          |
| KEY_UP_RIGHT    | 15    | Up-right key         |
| KEY_PAGE        | 17    | Page key             |
| KEY_START       | 18    | Start key            |
| KEY_LAP         | 19    | Lap key              |
| KEY_RESET       | 20    | Reset key            |
| KEY_SPORT       | 21    | Sport key            |
| KEY_CLOCK       | 22    | Clock key            |
| KEY_MODE        | 23    | Mode key             |
| KEY_ACTION_MENU | 24    | Action menu key      |

(source: connectiq-watchui-constants.md)

## View Transitions (SLIDE_*)

| Constant        | Value | Description    |
|-----------------|-------|----------------|
| SLIDE_IMMEDIATE | 0     | No transition  |
| SLIDE_LEFT      | 1     | Slide left     |
| SLIDE_RIGHT     | 2     | Slide right    |
| SLIDE_DOWN      | 3     | Slide down     |
| SLIDE_UP        | 4     | Slide up       |
| SLIDE_BLINK     | 5     | Fade in        |

(source: connectiq-watchui-constants.md)

## View Navigation

- **pushView(view, delegate, transition)** — push onto view stack
- **popView(transition)** — pop current view
- **switchToView(view, delegate, transition)** — replace current view
- **requestUpdate()** — trigger onUpdate() on the top-most view

(source: connectiq-watchui-constants.md)

See also: [[input-handling]], [[view-lifecycle]], [[fr245m-buttons]]
