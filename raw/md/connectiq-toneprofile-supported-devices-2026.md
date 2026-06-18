# ToneProfile API — Supported Devices (2026)

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Attention/ToneProfile.html
Fetched: 2026-06-17

## Class: Toybox.Attention.ToneProfile

Since: API Level 3.1.0

Define a tone pattern. ToneProfile objects specify tone characteristics
(frequency and duration) that can be combined in arrays and played
sequentially via the playTone() method.

### Constructor: initialize(aFrequency, aDuration)

- aFrequency (Lang.Number) — The tone's frequency measured in hertz (Hz)
- aDuration (Lang.Number) — The tone's duration measured in milliseconds (ms)

### Instance Members

- frequency — The frequency of the tone in hertz (Hz)
- duration — The duration of the tone in milliseconds (ms)

### Supported Devices

The API reference page lists 127+ devices as supporting ToneProfile. The
full list includes devices from the following families:

Approach S50, S70 (42mm, 47mm)
D2 Air X10, D2 Delta (standard, PX, S), D2 Mach 1, D2 Mach 2
Descent G1/G1 Solar, G2, Mk1, Mk2/Mk2i, Mk2 S, Mk3 43mm/Mk3i 43mm, Mk3i 51mm
Edge 130, 130 Plus, 520 Plus, 530, 540/540 Solar, 550, 820/Explore, 830, 840/840 Solar, 850, 1030, 1030/Bontrager, 1030 Plus, 1040/1040 Solar, 1050, Explore 2, MTB
Enduro, Enduro 3
epix (Gen 2), epix Pro (Gen 2) 42mm/47mm/51mm
eTrex Touch
fēnix 5/5S/5X, 5 Plus/5S Plus/5X Plus, Chronos
fēnix 6/6S/6X (all Solar/Pro/Sapphire/Dual Power variants)
fēnix 7/7S/7X (all Pro/Solar variants)
fēnix 8 43mm/47mm/51mm (all Solar/Pro/MicroLED variants)
fēnix E
Forerunner 55, 70, 165/165 Music, 170/170 Music, 245/245 Music, 255/255 Music/255s/255s Music, 265/265s, 570 42mm/570 47mm, 645/645 Music, 745, 935, 945/945 LTE, 955/Solar, 965, 970
GPSMAP 66s/66i/66sr/66st, 67/67i, H1/H1i Plus
Instinct 2/2S/2X Solar, Crossover, Crossover AMOLED, 3 AMOLED 45mm/50mm, 3 Solar 45mm/50mm, E 40mm/E 45mm
MARQ Gen 1 (Adventurer, Athlete, Aviator, Captain, Commander, Driver, Expedition, Golfer)
MARQ Gen 2 (Athlete/Adventurer/Captain/Golfer/Carbon/Commander-Carbon, Aviator)
Montana 7 Series
Venu 2, 2 Plus, 2S, 3, 3S, 4 41mm, 4 45mm, X1
vívoactive 5, 6

IMPORTANT: This list includes BOTH beeper and speaker devices. Speaker
devices (Venu 2 Plus, Venu 3/3S, Venu 4, fēnix 8, Forerunner 570,
Forerunner 970) are listed as supporting ToneProfile in the API docs, but
custom tone profiles are silently ignored on these devices because they
lack tone generator hardware. The :hasToneSupport annotation does not
distinguish between beeper and speaker devices. See the Garmin forum posts
forum-fenix8-toneprofile-bug.md and forum-playtones-new-devices.md for
Garmin's confirmation of this limitation.
