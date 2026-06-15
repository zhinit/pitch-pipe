import Toybox.Lang;
import Toybox.Test;

(:test)
function testGetFrequencyA4(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getFrequency(NoteData.A4_INDEX), 440);
    return true;
}

(:test)
function testGetFrequencyC3(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getFrequency(0), 131);
    return true;
}

(:test)
function testGetFrequencyB5(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getFrequency(35), 988);
    return true;
}

(:test)
function testGetNoteNameA4(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getNoteName(NoteData.A4_INDEX), "A");
    return true;
}

(:test)
function testGetOctaveA4(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getOctave(NoteData.A4_INDEX), 4);
    return true;
}

(:test)
function testGetDisplayNameA4(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getDisplayName(NoteData.A4_INDEX), "A4");
    return true;
}

(:test)
function testGetDisplayNameC3(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getDisplayName(0), "C3");
    return true;
}

(:test)
function testGetDisplayNameB5(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getDisplayName(35), "B5");
    return true;
}

(:test)
function testNoteCount(logger as Test.Logger) as Boolean {
    Test.assertEqual(NoteData.getNoteCount(), 36);
    return true;
}

(:test)
function testAllFrequenciesInRange(logger as Test.Logger) as Boolean {
    for (var i = 0; i < NoteData.getNoteCount(); i++) {
        var freq = NoteData.getFrequency(i);
        if (freq < 50 || freq > 4000) {
            logger.error("Frequency out of range at index " + i + ": " + freq);
            return false;
        }
    }
    return true;
}

(:test)
function testFrequenciesAscending(logger as Test.Logger) as Boolean {
    for (var i = 1; i < NoteData.getNoteCount(); i++) {
        if (NoteData.getFrequency(i) <= NoteData.getFrequency(i - 1)) {
            logger.error("Frequency not ascending at index " + i);
            return false;
        }
    }
    return true;
}
