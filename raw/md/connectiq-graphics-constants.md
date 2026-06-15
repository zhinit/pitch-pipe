# Graphics Module Constants (Toybox.Graphics)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics.html
Fetched: 2026-06-14

## Font Constants (FONT_*)

| Constant                    | Value | Description                           |
|-----------------------------|-------|---------------------------------------|
| FONT_XTINY                  | 0     | Extra tiny Connect IQ font            |
| FONT_TINY                   | 1     | Tiny Connect IQ font                  |
| FONT_SMALL                  | 2     | Small Connect IQ font                 |
| FONT_MEDIUM                 | 3     | Medium Connect IQ font                |
| FONT_LARGE                  | 4     | Large Connect IQ font                 |
| FONT_NUMBER_MILD            | 5     | Normal size number-only font          |
| FONT_NUMBER_MEDIUM          | 6     | Medium size number-only font          |
| FONT_NUMBER_HOT             | 7     | Large size number-only font           |
| FONT_NUMBER_THAI_HOT        | 8     | Huge size number-only font            |
| FONT_SYSTEM_XTINY           | 9     | Extra tiny system font                |
| FONT_SYSTEM_TINY            | 10    | Tiny system font                      |
| FONT_SYSTEM_SMALL           | 11    | Small system font                     |
| FONT_SYSTEM_MEDIUM          | 12    | Medium system font                    |
| FONT_SYSTEM_LARGE           | 13    | Large system font                     |
| FONT_SYSTEM_NUMBER_MILD     | 14    | Normal size number-only system font   |
| FONT_SYSTEM_NUMBER_MEDIUM   | 15    | Medium size number-only system font   |
| FONT_SYSTEM_NUMBER_HOT      | 16    | Large size number-only system font    |
| FONT_SYSTEM_NUMBER_THAI_HOT | 17    | Huge size number-only system font     |
| FONT_GLANCE                 | 18    | Glance text font                      |
| FONT_GLANCE_NUMBER          | 19    | Glance number-only font               |
| FONT_AUX1 through FONT_AUX9| 20-28 | Auxiliary fonts                       |

## Color Constants (COLOR_*)

| Constant         | Value      |
|------------------|------------|
| COLOR_WHITE      | 0xFFFFFF   |
| COLOR_LT_GRAY   | 0xAAAAAA   |
| COLOR_DK_GRAY    | 0x555555   |
| COLOR_BLACK      | 0x000000   |
| COLOR_RED        | 0xFF0000   |
| COLOR_DK_RED     | 0xAA0000   |
| COLOR_ORANGE     | 0xFF5500   |
| COLOR_YELLOW     | 0xFFAA00   |
| COLOR_GREEN      | 0x00FF00   |
| COLOR_DK_GREEN   | 0x00AA00   |
| COLOR_BLUE       | 0x00AAFF   |
| COLOR_DK_BLUE    | 0x0000FF   |
| COLOR_PURPLE     | 0xAA00FF   |
| COLOR_PINK       | 0xFF00FF   |
| COLOR_TRANSPARENT| -1         |

## Text Justification (TEXT_JUSTIFY_*)

| Constant              | Value | Description                          |
|-----------------------|-------|--------------------------------------|
| TEXT_JUSTIFY_RIGHT    | 0     | Right-justify text at coordinates    |
| TEXT_JUSTIFY_CENTER   | 1     | Center-justify text at coordinates   |
| TEXT_JUSTIFY_LEFT     | 2     | Left-justify text at coordinates     |
| TEXT_JUSTIFY_VCENTER  | 4     | Vertical text centering              |

## Arc Direction (ARC_*)

| Constant               | Value |
|------------------------|-------|
| ARC_COUNTER_CLOCKWISE  | 0     |
| ARC_CLOCKWISE          | 1     |

## Blend Modes

| Constant              | Value | Description          |
|-----------------------|-------|----------------------|
| BLEND_MODE_DEFAULT    | 0     | Alias for SOURCE_OVER|
| BLEND_MODE_NO_BLEND   | 1     | Alias for SOURCE     |
| BLEND_MODE_SOURCE_OVER| 0     | Standard alpha blend |
| BLEND_MODE_SOURCE     | 1     | No blending          |
| BLEND_MODE_MULTIPLY   | 2     | Multiply (GPU only)  |
| BLEND_MODE_ADDITIVE   | 3     | Additive (GPU only)  |
