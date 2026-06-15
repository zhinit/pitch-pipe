# Graphics.Dc API (Toybox.Graphics.Dc)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics/Dc.html
Fetched: 2026-06-14

## Drawing Methods

| Method                 | Parameters                                                    | Return | Description                         |
|------------------------|---------------------------------------------------------------|--------|-------------------------------------|
| drawText()             | x, y, font, text, justification                              | Void   | Render text at location             |
| drawAngledText()       | x, y, font (VectorFont), text, justification, angle          | Void   | Text perpendicular to radial line   |
| drawRadialText()       | x, y, font (VectorFont), text, justification, angle, radius, direction | Void | Text along an arc            |
| drawLine()             | x1, y1, x2, y2                                               | Void   | Line between two points             |
| drawPoint()            | x, y                                                         | Void   | Single point                        |
| drawCircle()           | x, y, radius                                                 | Void   | Circle outline                      |
| drawEllipse()          | x, y, a, b                                                   | Void   | Ellipse outline                     |
| drawRectangle()        | x, y, width, height                                          | Void   | Rectangle outline                   |
| drawRoundedRectangle() | x, y, width, height, radius                                  | Void   | Rounded rectangle outline           |
| drawArc()              | x, y, r, attr (ArcDirection), degreeStart, degreeEnd         | Void   | Arc segment                         |
| drawBitmap()           | x, y, bitmap                                                 | Void   | Bitmap at coordinates               |
| drawBitmap2()          | x, y, bitmap, options (Dictionary or Null)                   | Void   | Bitmap with transform/tint          |
| drawOffsetBitmap()     | x, y, bitmapX, bitmapY, bitmapWidth, bitmapHeight, bitmap    | Void   | Bitmap region at offset             |
| drawScaledBitmap()     | x, y, width, height, bitmap                                  | Void   | Scaled bitmap                       |

## Fill Methods

| Method                 | Parameters                    | Return | Description                         |
|------------------------|-------------------------------|--------|-------------------------------------|
| fillCircle()           | x, y, radius                  | Void   | Fill circle with foreground color   |
| fillEllipse()          | x, y, a, b                   | Void   | Fill ellipse with foreground color  |
| fillRectangle()        | x, y, width, height          | Void   | Fill rectangle with foreground color|
| fillRoundedRectangle() | x, y, width, height, radius  | Void   | Fill rounded rect with foreground   |
| fillPolygon()          | pts (Array, max 64 points)   | Void   | Fill polygon with foreground color  |

## Color and Style Methods

| Method          | Parameters                        | Return | Description                         |
|-----------------|-----------------------------------|--------|-------------------------------------|
| setColor()      | foreground, background (ColorType)| Void   | Set foreground and background colors|
| setStroke()     | stroke (Number or BitmapTexture)  | Void   | Set stroke for primitives           |
| setFill()       | fill (Number or BitmapTexture)    | Void   | Set fill for primitives             |
| setPenWidth()   | width                             | Void   | Set line thickness in pixels        |
| setAntiAlias()  | enabled (Boolean)                 | Void   | Enable/disable anti-aliased drawing |
| setBlendMode()  | mode (BlendMode)                  | Void   | Set drawing blend mode              |

## Clipping Methods

| Method     | Parameters           | Return | Description                           |
|------------|----------------------|--------|---------------------------------------|
| setClip()  | x, y, width, height | Void   | Apply rectangular clipping region     |
| clearClip()| (none)               | Void   | Reset drawable area to full surface   |

## Text Measurement Methods

| Method                  | Parameters       | Return          | Description                  |
|-------------------------|------------------|-----------------|------------------------------|
| getTextDimensions()     | text, font       | [Number, Number]| Text width and height        |
| getTextWidthInPixels()  | text, font       | Number          | Text width in pixels         |
| getFontHeight()         | font             | Number          | Font height in pixels        |

## Display Methods

| Method     | Parameters | Return | Description                    |
|------------|------------|--------|--------------------------------|
| getWidth() | (none)     | Number | Available display width        |
| getHeight()| (none)     | Number | Available display height       |
| clear()    | (none)     | Void   | Erase screen with bg color     |
