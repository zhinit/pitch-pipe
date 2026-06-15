# AppBase API (Toybox.Application.AppBase)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Application/AppBase.html
Fetched: 2026-06-14

## Overview

AppBase is the base class for Connect IQ applications. Subclasses override
lifecycle methods to initialize, display, and clean up the app.

## Key Lifecycle Methods

### getInitialView() → Array

Returns an Array containing a WatchUi.View and an optional input delegate.
Valid delegate types: BehaviorDelegate, ConfirmationDelegate, InputDelegate,
MenuInputDelegate, NumberPickerDelegate, PickerDelegate, TextPickerDelegate,
or WatchFaceDelegate.

**Mandatory** — must be overridden, otherwise the application will crash.

### onStart(state as Dictionary or Null) → Void

Invoked at startup before the initial view is retrieved. Used for app
initialization and settings management.

### onStop(state as Dictionary or Null) → Void

Called during termination. Used for cleanup and persistence of app state to
object storage.

### onActive(state) → Void

Triggered when app enters foreground.

### onInactive(state) → Void

Triggered when app is hidden from display.

### onSettingsChanged() → Void

Invoked when settings change via Garmin Connect Mobile.

### getGlanceView() → Array

Returns glance preview content.

### getServiceDelegate() → Array

Supplies background task delegate.
