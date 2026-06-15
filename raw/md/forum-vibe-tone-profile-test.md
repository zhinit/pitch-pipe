# Vibe & Tone Profile Test — Forum Showcase

Source: https://forums.garmin.com/developer/connect-iq/f/showcase/326948/vibe-tone-profile-test
Fetched: 2026-06-14

## Overview

A developer tool for Connect IQ that allows programmers to experiment with
vibration and audio notification settings before implementing them in their own
applications.

## Purpose

Designed for "CIQ developers" to "edit and try VibeProfile, ToneProfile and
the built-in tones." Not intended for regular users.

## How It Works

1. Open the VibraTest app on a compatible Garmin watch
2. Access settings within the Connect IQ companion app to configure profiles
3. Save changes to hear the tone and feel vibrations on the device

## Supported Features

- **VibeProfile**: Custom vibration patterns like "25,2000;50,2000;100,2000"
  (intensity,duration pairs in milliseconds)
- **ToneProfile**: Custom tone profiles like "2500,250;5000,250" (frequency in
  Hz, duration in ms)
- **Built-in tones**: Predefined tones like TONE_START, TONE_ALARM, etc.

## Availability

Connect IQ Store: https://apps.garmin.com/en-US/apps/22afbc10-e91b-4de7-a42d-05e8678728c8
GitHub: https://github.com/flocsy/VibraTest
