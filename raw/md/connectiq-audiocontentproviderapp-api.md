# Toybox.Application.AudioContentProviderApp — API Reference

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Application/AudioContentProviderApp.html
Fetched: 2026-06-17

## Class Overview

The base class for audio content provider apps, extending AppBase.
Provides methods for managing different initialization view types based
on app startup mode.

Since: API Level 3.0.0
App Types: Audio Content Provider, Background, Glance

## Instance Methods

### initialize()
Constructor for the class.
Since: API Level 3.0.0

### getContentDelegate(args: Application.PersistableType): Media.ContentDelegate
Retrieves a content delegate enabling system access to media content
iteration on devices.
Note: Must be overridden; calling without override causes application crash.
Since: API Level 3.0.0

### getPlaybackConfigurationView(): [WatchUi.Views] or [WatchUi.Views, WatchUi.InputDelegates]
Provides initial view and input delegate for playback configuration.
Note: Requires override; unimplemented call crashes application.
Since: API Level 3.0.0

### getSyncConfigurationView(): [WatchUi.Views] or [WatchUi.Views, WatchUi.InputDelegates]
Provides initial view and input delegate for sync configuration.
Note: Requires override; unimplemented call crashes application.
Since: API Level 3.0.0

### getProviderIconInfo(): Media.ProviderIconInfo or Null
Retrieves audio provider icon information.
Since: API Level 3.0.0

### getSyncDelegate(): Communications.SyncDelegate or Null (DEPRECATED)
Communicates sync status for media content synchronization.
Deprecation Note: May be removed after System 9.
Since: API Level 3.0.0

## Manifest Configuration

The correct application type is "audio-content-provider-app" (not
"audio-content-provider" — the docs had a bug; see
forum-audiocontentprovider-type-bug.md).

## Supported Devices

Same set as Media module — 80+ devices including all music-capable
Garmin wearables.
