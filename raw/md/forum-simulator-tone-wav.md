# Simulator ToneProfile generates WAV files

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/289367/is-there-a-way-to-playtone-with-two-or-more-frequencies-at-the-same-time
Fetched: 2026-06-15

Forum user Bodya discovered that the Connect IQ simulator generates a WAV file
from ToneProfile data:

"Examined this folder and have found GARMIN.wav file that sounds as last played
tune via Attention.playTone."

The WAV file is located in the simulator's temp directory:
`$TMPDIR/com.garmin.connectiq/GARMIN.wav` (macOS)

The original poster (dontOverSteer) also compared simulator vs device audio:
"It actually sounds much better on the watch than in the simulator, but still
doesn't sound good."

Local analysis of the WAV file (2026-06-15):
- Format: mono, 8-bit, 8000 Hz sample rate
- Duration: 5.000 seconds (regardless of ToneProfile duration parameter)
- The simulator synthesizes the requested frequency — zero-crossing analysis
  confirmed 875 Hz in the file when a non-440 note was selected
- The low sample rate (8 kHz) and 8-bit depth produce poor audio quality
  compared to actual device hardware
