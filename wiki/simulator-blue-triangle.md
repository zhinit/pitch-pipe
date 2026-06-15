# Simulator Blue Triangle

The blue triangle is the Connect IQ simulator's "no app running" screen. It
appears when an app exits or crashes — the simulator does not distinguish
between the two visually.
(source: forum-simulator-blue-triangle.md)

## Causes

- Normal app exit (BACK pressed on initial view, system handles exit)
- App crash (unhandled exception, fatal error)
- File transfer failure (PRG not reaching simulator temp directory)
- Project naming issues (spaces in project name)

(source: forum-simulator-blue-triangle.md)

## Distinguishing Crash from Normal Exit

The simulator provides no built-in way to tell them apart. To check:

1. Relaunch the app with `monkeydo` — if it loads, the previous exit was clean
2. Run via VS Code to see error output in the Output panel
3. Launch the simulator binary from the terminal to capture exit codes:

```
bin/ConnectIQ.app/Contents/MacOS/simulator; printf "\nError: $?\n"
```

There are no dedicated simulator log files.
(source: forum-simulator-logs.md)

## Known Simulator Bugs

Button presses invoking BehaviorDelegate functions (onPreviousPage, etc.) have
been reported to terminate apps in certain SDK versions. This was a confirmed
regression: worked in SDK 4.0.10, broke in 4.1.1/4.1.2. Garmin acknowledged
the bug. (source: forum-simulator-button-terminate.md)

See also: [[simulator]], [[app-exit]]
