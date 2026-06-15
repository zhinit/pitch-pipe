# Forerunner 245 Music — Physical Buttons

The FR245M has five physical buttons and no touchscreen.

## Layout

### Left Side (top to bottom)

| Button    | Short Press                                    | Long Press                |
|-----------|------------------------------------------------|---------------------------|
| **LIGHT** | Turn backlight on/off                          | View controls menu        |
| **UP**    | Scroll through widgets, data screens, settings | Display the menu          |
| **DOWN**  | Scroll through widgets, data screens, settings | Open music controls       |

### Right Side (top to bottom)

| Button        | Short Press                                           | Long Press            |
|---------------|-------------------------------------------------------|-----------------------|
| **START/STOP**| Start/stop activity timer; select option; acknowledge  | —                     |
| **BACK**      | Return to previous screen                              | Record lap in activity|

(source: fr245-owners-manual-buttons.md)

## Mapping to Connect IQ Key Constants

The FR245M is a button-only device (no touchscreen). Based on the standard
five-button Forerunner layout and Connect IQ conventions:

| Physical Button | KEY_* Constant       | BehaviorDelegate Method |
|-----------------|----------------------|-------------------------|
| LIGHT           | KEY_LIGHT (1)        | —                       |
| UP              | KEY_UP (13)          | onPreviousPage()        |
| DOWN            | KEY_DOWN (8)         | onNextPage()            |
| START/STOP      | KEY_ENTER (4) or KEY_START (18) | onSelect()     |
| BACK            | KEY_ESC (5)          | onBack()                |
| UP (long)       | KEY_MENU (7)         | onMenu()                |

The START/STOP button may generate either KEY_ENTER or KEY_START depending on
firmware version — older Forerunners had inconsistencies between simulator and
hardware. Both should be handled. (source: forum-key-start-vs-enter.md,
forum-device-button-behaviour.md)

## Implications for This Project

With five buttons and no touchscreen, the pitch pipe has limited but
predictable input:

- **UP/DOWN** — natural for scrolling through notes or octaves
- **START/STOP** — natural for "play this note" (select action)
- **BACK** — exit the app or go back from a sub-view
- **MENU (long-press UP)** — settings or options

See also: [[input-handling]], [[fr245m-device]]
