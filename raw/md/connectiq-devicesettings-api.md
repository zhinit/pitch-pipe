# Toybox.System.DeviceSettings — API Reference

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/System/DeviceSettings.html
Fetched: 2026-06-15

## Class Overview

`Toybox.System.DeviceSettings` represents various device settings accessible
through `System.getDeviceSettings()`. Inherits from `Toybox.Lang.Object`.
Available since API Level 1.0.0.

## Instance Properties

### Display & Screen

- **screenWidth** (`Number`) — device screen width in pixels
- **screenHeight** (`Number`) — device screen height in pixels
- **screenShape** (`System.ScreenShape`) — shape of device screen
- **isTouchScreen** (`Boolean`) — touch screen availability and status
- **fontScale** (`Float`) — text scaling factor (0.8–1.2 range typical; API 5.0.1+)
- **requiresBurnInProtection** (`Boolean`) — screen burn-in protection requirement
- **isNightModeEnabled** (`Boolean`) — night mode color usage status
- **isEnhancedReadabilityModeEnabled** (`Boolean`) — enhanced readability mode status

### Time & Locale

- **is24Hour** (`Boolean`) — clock format mode (24-hour vs. 12-hour)
- **firstDayOfWeek** (`Gregorian.DayOfWeek`) — starting weekday
- **systemLanguage** (`System.Language`) — system language setting

### Unit Preferences

- **distanceUnits** (`System.UnitsSystem`) — kilometers vs. miles
- **elevationUnits** (`System.UnitsSystem`) — meters vs. feet
- **heightUnits** (`System.UnitsSystem`) — meters vs. feet
- **paceUnits** (`System.UnitsSystem`) — km/h vs. mph
- **temperatureUnits** (`System.UnitsSystem`) — celsius vs. fahrenheit
- **weightUnits** (`System.UnitsSystem`) — kilograms vs. pounds

### Connection & Communication

- **phoneConnected** (`Boolean`) — mobile phone connection status
- **phoneOperatingSystem** (`System.PhoneOperatingSystem` or `Null`) — connected device OS (API 5.0.1+)
- **connectionAvailable** (`Boolean`) — any communication channel active
- **connectionInfo** (`Dictionary`) — detailed connection states (`:bluetooth`, `:wifi`, `:lte`)

### Device & Notification Status

- **alarmCount** (`Number`) — active alarms set
- **notificationCount** (`Number`) — active notifications
- **activityTrackingOn** (`Boolean`) — activity tracking enabled status
- **doNotDisturb** (`Boolean`) — Do Not Disturb mode (device-dependent)

### Device Identification

- **partNumber** (`String`) — device part number
- **uniqueIdentifier** (`String` or `Null`) — stable, app-specific device identifier
- **firmwareVersion** (`Array`) — two-element [major, minor] version array
- **monkeyVersion** (`Array`) — three-element [major, minor, micro] Connect IQ version

### User Input & Preferences

- **inputButtons** (`System.ButtonInputs`) — supported physical buttons (bitwise value)
- **tonesOn** (`Boolean`) — audio tone setting
- **vibrateOn** (`Boolean`) — vibration setting
- **isGlanceModeEnabled** (`Boolean`) — widget glance support status

## Usage Example

```monkeyc
using Toybox.System;
var settings = System.getDeviceSettings();
var is24hr = settings.is24Hour;
var version = settings.monkeyVersion;
var formatted = Lang.format("$1$.$2$.$3$", version);
```

## API Level Progression

- **1.0.0** — basic unit and time settings introduced
- **1.1.0** — phone connection status added
- **1.2.0** — version info, alarms, notifications, screen properties, buttons
- **2.1.0** — Do Not Disturb mode
- **2.4.1** — unique device identifier
- **3.0.0** — connection info and availability
- **3.1.0** — system language
- **3.1.4** — glance mode enabled
- **4.1.2** — night mode indicator
- **4.2.3** — enhanced readability mode
- **5.0.1** — font scaling and phone OS information
