import Toybox.Lang;

module NoteData {

    const NOTE_NAMES as Array<String> = [
        "C", "C#", "D", "D#", "E", "F",
        "F#", "G", "G#", "A", "A#", "B"
    ];

    const OCTAVE as Number = 4;
    const NOTE_COUNT as Number = 12;

    const FREQUENCIES as Array<Number> = [
        262, 277, 294, 311, 330, 349,
        370, 392, 415, 440, 466, 494
    ];

    const A4_INDEX as Number = 9;

    function getNoteName(index as Number) as String {
        return NOTE_NAMES[index];
    }

    function getOctave(index as Number) as Number {
        return OCTAVE;
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
