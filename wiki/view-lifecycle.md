# View Lifecycle and Graphics

## View Lifecycle

For watch apps, the lifecycle is:

```
initialize() → onLayout(dc) → onShow() → onUpdate(dc) → onHide()
```

The app is created from scratch each time it is displayed — all lifecycle
methods are called. During normal operation, only onUpdate() is called on
each display refresh. (source: blog-improve-app-performance.md)

### Method Responsibilities

| Method       | Parameter    | Purpose                                          |
|--------------|--------------|--------------------------------------------------|
| initialize() | —           | Constructor; set up instance variables            |
| onLayout(dc) | Graphics.Dc | Load resources, configure layout, pre-calculate   |
| onShow()     | —           | On-demand init when view enters foreground        |
| onUpdate(dc) | Graphics.Dc | Draw the screen; called on each refresh           |
| onHide()     | —           | Free resources when view leaves foreground        |

(source: connectiq-view-api.md)

### Triggering Updates

`WatchUi.requestUpdate()` triggers onUpdate() on the top-most view. Call it
from a delegate callback, timer, or sensor handler to refresh the display.
(source: connectiq-watchui-constants.md)

## App Entry Point

```monkeyc
class MyApp extends Application.AppBase {
    function getInitialView() {
        return [new MyView(), new MyDelegate()];
    }
}
```

getInitialView() returns an Array with a View and an optional delegate.
It is mandatory — the app crashes without it.
(source: connectiq-appbase-api.md)

## Graphics.Dc — The Drawing Context

The `dc` parameter passed to onLayout() and onUpdate() is a Graphics.Dc
object — the device context for all drawing operations.

### Screen Properties

```monkeyc
var width = dc.getWidth();    // 240 for FR245M
var height = dc.getHeight();  // 240 for FR245M
```

### Color

```monkeyc
dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
dc.clear();  // fill screen with background color
```

15 named colors available (COLOR_WHITE, COLOR_BLACK, COLOR_RED, etc.) plus
COLOR_TRANSPARENT (-1). The [[fr245m-device]] supports 64 colors — named
colors are mapped to the nearest available.
(source: connectiq-graphics-constants.md, connectiq-graphics-dc-api.md)

### Drawing Text

```monkeyc
dc.drawText(
    dc.getWidth() / 2,              // x
    dc.getHeight() / 2,             // y
    Graphics.FONT_LARGE,            // font
    "A4",                           // text
    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER  // justify
);
```

Justification values: TEXT_JUSTIFY_LEFT (2), TEXT_JUSTIFY_CENTER (1),
TEXT_JUSTIFY_RIGHT (0), TEXT_JUSTIFY_VCENTER (4). Can be combined with
bitwise OR. (source: connectiq-graphics-constants.md)

### Text Measurement

```monkeyc
var dims = dc.getTextDimensions("A4", Graphics.FONT_LARGE);  // [w, h]
var w = dc.getTextWidthInPixels("A4", Graphics.FONT_LARGE);
var h = dc.getFontHeight(Graphics.FONT_LARGE);
```

(source: connectiq-graphics-dc-api.md)

### Drawing Shapes

```monkeyc
dc.fillCircle(120, 120, 100);            // filled circle
dc.drawCircle(120, 120, 100);            // circle outline
dc.drawArc(120, 120, 100,               // arc
    Graphics.ARC_CLOCKWISE, 0, 90);
dc.fillRectangle(10, 10, 50, 30);       // filled rectangle
dc.drawLine(0, 0, 240, 240);            // line
dc.setPenWidth(3);                        // line thickness
```

(source: connectiq-graphics-dc-api.md)

### Available Fonts

| Constant               | Value | Description                    |
|------------------------|-------|--------------------------------|
| FONT_XTINY             | 0     | Extra tiny                     |
| FONT_TINY              | 1     | Tiny                           |
| FONT_SMALL             | 2     | Small                          |
| FONT_MEDIUM            | 3     | Medium                         |
| FONT_LARGE             | 4     | Large                          |
| FONT_NUMBER_MILD       | 5     | Normal number-only font        |
| FONT_NUMBER_MEDIUM     | 6     | Medium number-only font        |
| FONT_NUMBER_HOT        | 7     | Large number-only font         |
| FONT_NUMBER_THAI_HOT   | 8     | Huge number-only font          |

Number-only fonts (FONT_NUMBER_*) render only digits and a few symbols, but
are larger than their text counterparts. System variants (FONT_SYSTEM_*)
also exist at values 9–17.
(source: connectiq-graphics-constants.md)

## Performance

Pre-calculate values in onLayout() and store for use in onUpdate(). Complex
rendering can take up to 700ms, blocking the system.
(source: blog-improve-app-performance.md)

## Layouts vs. Direct Drawing

Views can use XML-defined layouts (loaded via `setLayout(Rez.Layouts.X(dc))`)
or draw directly in onUpdate(). For a simple UI like a pitch pipe, direct
drawing in onUpdate() is simpler and avoids the overhead of the layout system.
(source: connectiq-view-api.md, github-lidar-theremin-view.md)

See also: [[input-handling]], [[fr245m-device]], [[watchui-constants]]
