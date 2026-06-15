# App Exit (BACK Button Handling)

## Recommended Approach

For the initial view of a watch-app, do not handle onBack in the delegate.
Let the system manage the exit by either:

- Not implementing onBack at all
- Returning `false` from onBack

Garmin staff: "return false and let the system do it" when the back key is
pressed from the last view. (source: forum-onback-exit-app.md)

## What Not To Do

- Do not call `WatchUi.popView()` on the initial view — there is nothing
  below it to pop to
- Do not store `App.getApp()` as an instance variable in a BehaviorDelegate —
  this caused crashes on some devices (Fenix 3). Call it locally within
  functions instead. (source: forum-onback-exit-app.md)

## Widgets vs Apps

Widgets should never pop their initial view. Apps can pop it, but letting the
system handle it is safer. (source: forum-onback-exit-app.md)

## Simulator Behavior

Pressing BACK on the initial view shows the [[simulator-blue-triangle]]. This
is normal — it means the app exited. The app can be relaunched with `monkeydo`.

See also: [[input-handling]], [[simulator-blue-triangle]], [[view-lifecycle]]
