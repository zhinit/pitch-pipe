# Garmin Connect IQ Command Line Build and Simulator Guide

Source: https://take4-blue.com/en/program/garmin/garmin-connect-iq-start-build-simulator-on-command-line/
Author: Take4-blue
Fetched: 2026-06-14

This blog post explains how to build Garmin Connect IQ programs and launch the simulator from the command line rather than through Eclipse.

## Build Command Structure

The build process uses a Java command with this format:

```
java -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true -jar 'SDK jar file' -o 'output.prg' -w -y 'Developer key' -d 'Device name' -f 'monkey.jungle filename'
```

## Required Parameters

Five user-specified elements are needed:

1. **SDK JAR file** — Located in `%APPDATA%\garmin\GarminConnectIQ\Sdks` (version 3.2+), with the specific path stored in `current-sdk.cfg`. The build uses `bin\monkeybrains.jar` from the SDK base directory.

2. **Output filename** — The compiled program with `.prg` extension, creatable in any folder.

3. **Developer key** — The authentication file specified in IDE settings.

4. **Device name** — The product name from `manifest.xml`. Programs must be built specifically for each device, not universally.

5. **Monkey.jungle file** — The project configuration file.

## Simulator Operation

Launch the simulator executable at `SDK base\bin\simulator.exe`, then load programs using:

```
SDK base\bin\monkeydo.bat 'Program name' 'Device name'
```

To stop individual programs, use "File → Kill Device" in the simulator window. This clears the device state, allowing different programs and devices to be tested sequentially.

To quit the simulator entirely, use "File → Quit".
