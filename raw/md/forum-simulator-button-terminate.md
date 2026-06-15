# Simulator button presses terminate app

Source: https://forums.garmin.com/developer/connect-iq/i/bug-reports/simulator-button-presses-terminate-app
Fetched: 2026-06-15

A confirmed simulator bug where button presses that invoke BehaviorDelegate
functions (such as onPreviousPage) cause the app to terminate in the simulator.

Details:
- Only the Start button (onSelect) worked; other buttons terminated the app
- Worked in SDK 4.0.10, broke in SDK 4.1.1 and 4.1.2
- Some devices (fenix7s) worked while others (fenix6s) did not
- The developer did not change code — regression from SDK update
- Suspected relation to System.getDeviceSettings().isGlanceModeEnabled
  returning false even when enabled in simulator settings
- Status: "Acknowledged" by Garmin, no confirmed fix documented
