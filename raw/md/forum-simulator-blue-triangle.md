# Device simulator stuck in blue triangle mode

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/6712/device-simulator-stuck-in-blue-triangle-mode
Fetched: 2026-06-15

The blue triangle in the Connect IQ simulator indicates the application has
terminated — either crashed or exited. It is the simulator's "no app running"
state.

Causes discussed in the thread:
- App crash during execution
- Normal app exit (all views popped)
- Project naming problems (spaces in project name)
- File transfer failures (PRG not reaching simulator's temp directory)
- Permission issues on macOS

The thread does not distinguish between "app crashed" and "app exited normally"
in the blue triangle display — both produce the same visual result.
