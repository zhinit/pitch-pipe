# Toybox.Media Module — API Reference

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Media.html
Fetched: 2026-06-17

## Module Overview

The Media module enables developers to build audio content provider
applications. It manages downloaded media content and supplies playback
information to the system.

Since: API Level 3.0.0
App Types: Audio Content Provider, Background, Glance

## Device Compatibility

Supports 80+ devices including: Forerunner series (165, 170, 245, 255,
265, 570, 645, 745, 945, 955, 965, 970 Music variants), fēnix series
(5 Plus through 8 Pro), Venu series (all models), vívoactive series
(3 Music through 6), MARQ series, Approach, Descent, Enduro, epix, and
tactix variants, special editions (Captain Marvel, Darth Vader, etc.).

## Audio Encodings

- ENCODING_INVALID
- ENCODING_ADTS
- ENCODING_MP3
- ENCODING_M4A
- ENCODING_WAV

## Core Classes

ActiveContent, AlbumArt, AudioFormat, CacheStatistics, Content,
ContentDelegate, ContentIterator, ContentMetadata, ContentRef,
ContentRefIterator, CustomButton, PlaybackProfile, PlayerColors,
ProviderIconInfo, SyncDelegate, SystemButton

## Key Methods

- deleteCachedItem() — Remove individual cached media
- getCacheStatistics() — Access cache size data
- getCachedContentObj() — Retrieve stored Content by reference
- getContentRefIter() — Iterate cached media with shuffle option
- requestPlaybackProfileUpdate() — Update player configuration
- resetContentCache() — Clear cache and encryption keys
- setAlbumArt() — Display album artwork during playback
- startPlayback() — Launch playback mode with arguments
- stopPlayback() — Halt app-initiated playback

## Playback Architecture

Apps must use the system media player. The playback flow requires
developers to define a Media.ContentDelegate class that provides a
Media.ContentIterator containing downloaded songs. This enables the
native media player to handle playback while apps control what content
displays and which controls appear.

The app cannot directly play audio — it provides content references to
the system player.
