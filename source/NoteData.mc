import Toybox.Lang;

module NoteData {

    const NOTE_NAMES as Array<String> = [
        "C", "C#", "D", "D#", "E", "F",
        "F#", "G", "G#", "A", "A#", "B"
    ];

    const FIRST_OCTAVE as Number = 3;
    const LAST_OCTAVE as Number = 5;
    const NOTES_PER_OCTAVE as Number = 12;
    const NOTE_COUNT as Number = 36;

    const FREQUENCIES as Array<Number> = [
        // Octave 3: C3–B3
        131, 139, 147, 156, 165, 175,
        185, 196, 208, 220, 233, 247,
        // Octave 4: C4–B4
        262, 277, 294, 311, 330, 349,
        370, 392, 415, 440, 466, 494,
        // Octave 5: C5–B5
        523, 554, 587, 622, 659, 698,
        740, 784, 831, 880, 932, 988
    ];

    // Index of A4 within the FREQUENCIES array
    const A4_INDEX as Number = 21;

    function getNoteName(index as Number) as String {
        return NOTE_NAMES[index % NOTES_PER_OCTAVE];
    }

    function getOctave(index as Number) as Number {
        return FIRST_OCTAVE + (index / NOTES_PER_OCTAVE);
    }

    function getFrequency(index as Number) as Number {
        return FREQUENCIES[index];
    }

    function getDisplayName(index as Number) as String {
        return getNoteName(index) + getOctave(index).toString();
    }

    function getNoteCount() as Number {
        return NOTE_COUNT;
    }

}
