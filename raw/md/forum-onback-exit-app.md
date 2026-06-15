# Appropriate way to handling exiting/onBack in an app?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/535/appropriate-way-to-handling-exiting-onback-in-an-app
Fetched: 2026-06-15

Garmin staff guidance on handling BACK button exit:

For applications: you can either manually pop the final view or "return false
and let the system do it" when the back key is pressed from the last view.

For widgets: "Widgets should not pop their initial view; simply return false
when the back/escape key is pressed from the last view."

Key recommendations:
- Don't explicitly handle onBack on the base view — let the system handle it
  by returning false or not implementing onBack at all.
- Avoid calling popView on exit from the initial view.
- A specific bug was reported where storing App.getApp() as an instance
  variable in a BehaviorDelegate caused crashes on Fenix 3. Solution: call
  App.getApp() locally within functions instead.

The safest approach is to not handle the back button on the main app view and
let Garmin's system manage the exit.
