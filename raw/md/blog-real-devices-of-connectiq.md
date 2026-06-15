# The Real Devices of Connect IQ (Part 1)

Source: https://forums.garmin.com/developer/connect-iq/b/news-announcements/posts/the-real-devices-of-connect-iq-part-1
Fetched: 2026-06-14

## Premium "Glamour" Devices

High-end wearables with advanced displays:

- **epix (Gen 2)**: 416×416 AMOLED, 65,536 colors, touchscreen + buttons.
  768 KB device app memory, API level 4.0.0.
- **Venu 2 Series**: AMOLED displays (416×416 or 360×360), 768 KB app memory.
  "While Venu 2 Plus offers integration with your phone's voice assistant,
  Connect IQ does not offer any integration with the device microphone."
- **Venu and Venu Sq**: Earlier AMOLED/LCD devices with 1024 KB watch face
  memory but only 32 KB for data fields.

## Entry-Level "Slender" Devices

Resource-constrained models with 128 KB or less for device apps:

- **Forerunner 245 / fēnix 6 series**: 128 KB app memory with 64-color MIP
  screens
- **Forerunner 55**: Entry-level with only 8-color (208×208) display
- **Venu Sq**: 128 KB limit but offers full-color LCD
- **Instinct 2**: Most constrained at 96 KB app memory with a unique 2-color
  octagonal screen

## Key Design Considerations

AMOLED devices require special attention to battery efficiency: "every pixel
uses power, and apps with bright, solid-color backgrounds can drain the battery
faster." Recommended: "light-on-dark design with gradients that fade to black."

For entry-level devices, developers should "optimize your resources to use the
minimum bit depth necessary" and employ build exclusions strategically.
