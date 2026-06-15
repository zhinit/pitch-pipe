# Connect IQ Platform

Connect IQ is Garmin's app platform for wearable devices. Apps are written in
[[monkey-c]], compiled with the Connect IQ SDK, and run on compatible Garmin
watches and cycling computers.

## SDK

The current SDK is version 9.2.0 (June 2026). It supports Connect IQ 1.x,
2.x, and 3.x devices. (source: connectiq-sdk-overview.md)

The SDK includes sample code, simulators, tools, and libraries. Development
uses the VS Code Monkey C extension. (source: connectiq-sdk-overview.md)

The SDK Manager must be installed first; it then downloads the SDK and device
simulators. A developer RSA 4096-bit key is required for signing apps — losing
this key means you cannot update published apps.
(source: connectiq-sdk-overview.md)

## App Types

Connect IQ supports five app types (source: connectiq-sample-apps-repo.md):

| Type                   | Description                                              |
|------------------------|----------------------------------------------------------|
| **Device App**         | Full-featured third-party activity apps                  |
| **Widget**             | At-a-glance apps, auto-close after inactivity            |
| **Watch Face**         | Low-power home screen replacements                       |
| **Data Field**         | Apps running within native activities                    |
| **Audio Provider**     | Apps for device media player audio content               |

## Project Structure

A Connect IQ project consists of (source: connectiq-programmers-guide-toc.md):

- **manifest.xml** — app metadata, target products, permissions
- **monkey.jungle** — build configuration
- **source/** — Monkey C source files
- **resources/** — layouts, drawables, fonts, strings

## Device Simulator

The SDK includes simulators for each device model. The simulator can run and
debug apps, but does not perfectly replicate hardware behavior — notably,
[[toneprofile-api]] works in the simulator on all devices but may fail
silently on physical hardware with speakers rather than beepers.
(source: forum-tones-not-playing-venu2plus.md)

## Publishing

Apps are published to the Connect IQ Store. The process includes validation,
review, and approval. (source: connectiq-programmers-guide-toc.md)

See also: [[fr245m-device]], [[monkey-c]], [[attention-api]], [[simulator]]
