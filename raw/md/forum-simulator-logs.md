# Simulator logs

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/2652/simulator-logs
Fetched: 2026-06-15

There are no dedicated log files for the Connect IQ simulator. Garmin staff
(Travis Vitek): "I don't see any log files that you might be able to use to
see what is happening."

To see output when running from the terminal on macOS:

    bin/ConnectIQ.app/Contents/MacOS/simulator; printf "\nError: $?\n"

This displays an exit code when the simulator terminates. System.println
output appears in the Eclipse console or VS Code Output panel — not in
separate files.
