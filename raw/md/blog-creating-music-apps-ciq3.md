# Creating Music Apps in Connect IQ 3

Source: https://www.garmin.com/en-US/blog/developer/creating-music-apps-3x/
Fetched: 2026-06-17

## Audio Content Provider Architecture

Audio content provider apps act as "a bridge between the wearable and a
Content Delivery Network (CDN)." These apps enable third-party music
services to deliver protected content directly to Garmin music-enabled
wearables.

## Content Syncing Process

The sync workflow involves three steps:

1. The Connect IQ app requests an audio file download via web API
2. The backend service delivers the file from the CDN
3. The app stores the file on the watch's filesystem with encryption
   applied during the write process

"No un-encrypted content ever gets written to the filesystem," ensuring
protected delivery.

## Security & Storage

Content receives multiple layers of protection:
- Files stored in hidden device folders
- AES-128 encryption applied to apps and audio files
- "App can destroy all downloaded and reset encryption key in a single call"
- Each app accesses an isolated storage sandbox

## Playback Architecture

Apps must use the system media player. The playback flow requires
developers to define a Media.ContentDelegate class that provides a
Media.ContentIterator containing downloaded songs. This enables the
native media player to handle playback while apps control what content
displays and which controls appear.

A watch-app cannot play audio files. Only audio-content-provider-app
types can provide content to the system media player.

## Storage Limitations

The storage system provides "a simple key/value system for persisting
content, but values are limited to 8KB," requiring careful structural
design for playback reporting data.
