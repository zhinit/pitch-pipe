# Getting Started with Garmin Connect IQ Development: Build Your First Watch Face with Monkey C and VS Code

Source: https://www.ottorinobruni.com/getting-started-with-garmin-connect-iq-development-build-your-first-watch-face-with-monkey-c-and-vs-code/
Author: Ottorino Bruni
Fetched: 2026-06-14

## Introduction

The author, a seasoned software developer, shares his journey from Apple Watch to Garmin devices. After years of daily charging routines with Apple Watch, he switched to the Garmin Instinct 3 Solar for its superior battery life and durability, seeking to explore development opportunities on the platform.

## Understanding Connect IQ: Garmin's Development Platform

Connect IQ is Garmin's ecosystem for creating custom applications, watch faces, widgets, and data fields. Key components include:

- **Monkey C**: A proprietary programming language similar to Java/C++
- **Connect IQ SDK**: Development toolkit and simulator
- **Visual Studio Code Extension**: Official development environment
- **Companion Mobile App**: For testing and installation

The platform supports various application types including watch faces, widget apps, data fields, background services, and full applications. Developers gain access to device sensors (heart rate, GPS), custom UI elements, background processing, data storage, Bluetooth connectivity, and web API integration.

## Prerequisites for Development

Before starting, install:

- Garmin Connect IQ SDK
- Visual Studio Code
- Java Development Kit (JDK)
- Garmin Monkey C Extension

## Setting Up Connect IQ SDK Manager

The setup process involves:

1. Downloading from developer.garmin.com
2. Launching SDK Manager and logging in with Garmin Connect account
3. Configuring update preferences
4. Managing SDKs and device support

## Creating a Developer Key

"Every Garmin app requires signing with a private RSA 4096-bit key." This key must be maintained securely, as losing it prevents future app updates.

## Creating Your First Watch Face

The process uses VS Code's Command Palette to create a new project, selecting "Watch Face" as the project type and target device. The wizard generates a basic project structure automatically.

## Testing and Deploying

Testing occurs through the simulator, while deployment involves:

1. Building for device via Command Palette
2. Connecting the Garmin device via USB
3. Copying the generated `.prg` file to `GARMIN/APPS` directory

## Key Takeaway

The author notes a disclaimer: "This example is purely for educational purposes. There are better ways to write code and applications that can optimize this example."
