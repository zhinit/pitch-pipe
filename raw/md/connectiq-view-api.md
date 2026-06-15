# View API (Toybox.WatchUi.View)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/View.html
Fetched: 2026-06-14

## Class Hierarchy

```
Toybox.Lang.Object
└── Toybox.WatchUi.View
```

## Overview

A View represents a page within an app, containing a Layout with Drawable
objects like Bitmaps and Text. Views manage the app lifecycle differently based
on app type.

## View Lifecycle

### Widgets and Watch Apps

```
onLayout() → onShow() → onUpdate() → onHide()
```

### Watch Faces

```
onLayout() → onShow() → onUpdate()
```

## Core Methods

### initialize()
Constructor for initializing the View instance.

### onLayout(dc as Graphics.Dc) → Void
Called before the View displays. Used to load resources and configure the
layout. Parameter `dc` provides the device context.

### onShow() → Void
Called when the View enters the foreground, before periodic updates begin.
Resources should be loaded into memory here.

### onUpdate(dc as Graphics.Dc) → Void
Called after onShow() to update dynamic content. Invoked on-demand for
widgets/apps (via WatchUi.requestUpdate()). If not overridden, Drawable
objects render automatically.

### onHide() → Void
Called when the View leaves the foreground. Resources should be freed here.

### findDrawableById(identifier as Lang.Object) → WatchUi.Drawable or Null
Retrieves a Drawable by its identifier, useful for accessing layout
information to format dynamic content.

### setLayout(layout as Array<WatchUi.Drawable> or Null) → Void
Sets the array of Drawable objects. These are automatically drawn via
onUpdate() and searchable via findDrawableById().

## Code Example

```monkeyc
using Toybox.WatchUi;

class MyWidgetView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() {
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }
}
```

## Supported App Types

Audio Content Provider, Data Field, Glance, Watch App, Watch Face, Widget.
