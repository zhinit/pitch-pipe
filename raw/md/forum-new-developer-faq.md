# Forum: New Developer FAQ

Source: https://forums.garmin.com/developer/connect-iq/w/wiki/4/new-developer-faq

## Where can I download the SDK?

The latest SDK is available at http://developer.garmin.com/connect-iq/sdk/

## How do I get started with Connect IQ?

Several resources support new developers:

- The "Connect IQ Basics Guide" introduces Monkey C and Connect IQ
  fundamentals
- "Core Topics" and "User Experience Guide" provide in-depth information
- API Documentation and Monkey C specifics are available on the developer site
- Sample apps in the SDK's 'samples' folder demonstrate basic capabilities
- The forums offer community assistance, with monitored discussions from the
  Connect IQ team

## Building Apps for Multiple Devices

Developers can target any Connect IQ-compatible devices by configuring a
minimum SDK version. The build system creates version-appropriate PRG files for
each eligible device based on the minimum SDK selected.

## Monetization

Yes, developers are allowed to charge for apps through the Connect IQ App
Store. Garmin provides monetization solutions. Developers may also list
prices, link to payment sites, or request donations within app store listings
when properly marked.

## Displaying Seconds on Watch Faces

Watch faces typically update once per minute in low power mode and once per
second in full power mode. Devices enter full power mode briefly when users
gesture, then return to low power mode. Many developers display seconds
briefly during this transition. Newer devices support Always On watch faces
with continuous updates within specific limits.

## Leading Zeros Formatting

Use the `%02d` format specifier in Monkey C's string formatting functions. The
format specifiers `%.2d` or `%0.2d` won't work correctly — Monkey C follows
C99 standards requiring the `0` flag before the width specifier.

## Side-Loading Apps for Testing

Using the Monkey C Visual Studio Code Extension:

1. Open Command Palette and select "Monkey C: Build for Device"
2. Choose the target product
3. Select output location
4. Choose Debug or Release
5. Connect device via USB
6. Copy the PRG file to `/GARMIN/APPS`
7. Disconnect the device

## App Settings Limitations

App settings depend on the Connect IQ App Store to function properly.
Side-loaded apps cannot access these features since they bypass the App Store
connection. To test settings functionality, submit the app to the App Store in
beta or pending approval status.

## Settings Type Validation

Settings values may return unexpected types. Best practice involves checking
values and converting as needed:

```monkey
function readKeyInt(myApp, key, thisDefault) {
    var value = myApp.getProperty(key);
    if (value == null || !(value instanceof Number)) {
        if (value != null) {
            value = value.toNumber();
        } else {
            value = thisDefault;
        }
    }
    return value;
}
```

## Too Many Arguments Error

The 2.1.2 SDK introduced argument count checking for security purposes. This
caused crashes on older devices even when apps ran successfully with earlier
SDK versions. Common causes include:

- Missing `state` arguments in `onStart()` and `onStop()` methods
- Calling `initialize()` without required array arguments

## Testing and Debugging Methods

**Basic Testing:** Insert `System.println()` statements throughout code. In
Eclipse these output to console; on devices they write to
`/GARMIN/APPS/LOGS/<APPNAME>.TXT` (must be created manually).

**Advanced Tools:**
- "Run No Evil" unit testing framework
- Eclipse debugger included in Connect IQ plug-in
- See Debugging and Unit Testing chapters in Core Topics Guide

## Crash Log Analysis

**App Crashes** produce `/GARMIN/APPS/LOGS/CIQ_LOG.YML` files containing call
stacks. The app quits unexpectedly or displays an 'IQ!' icon without
rebooting the device.

**Device Crashes** produce `ERR_LOG.TXT` in `/GARMIN` or `/GARMIN/DEBUG`,
indicating firmware issues. These cause reboots or freezes.

Log files exceeding 5 KB automatically archive to `.BAK` files (~10 KB
maximum practical space).

## Reporting Bugs

Report suspected Connect IQ bugs in the "Connect IQ Bug Reports" tool. Review
the "Bug Reporting FAQ" first to provide necessary investigation information.
Bug reports posted in discussion forums may be moved or deleted.
