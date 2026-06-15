import Toybox.Lang;
import Toybox.Test;

(:test)
function testInitialIndexIsA4(logger as Test.Logger) as Boolean {
    var sel = new NoteSelector();
    Test.assertEqual(sel.getCurrentIndex(), NoteData.A4_INDEX);
    return true;
}

(:test)
function testNextIncrements(logger as Test.Logger) as Boolean {
    var sel = new NoteSelector();
    var before = sel.getCurrentIndex();
    sel.next();
    Test.assertEqual(sel.getCurrentIndex(), before + 1);
    return true;
}

(:test)
function testPreviousDecrements(logger as Test.Logger) as Boolean {
    var sel = new NoteSelector();
    var before = sel.getCurrentIndex();
    sel.previous();
    Test.assertEqual(sel.getCurrentIndex(), before - 1);
    return true;
}

(:test)
function testNextWrapsAtEnd(logger as Test.Logger) as Boolean {
    var sel = new NoteSelector();
    sel.setIndex(NoteData.getNoteCount() - 1);
    sel.next();
    Test.assertEqual(sel.getCurrentIndex(), 0);
    return true;
}

(:test)
function testPreviousWrapsAtStart(logger as Test.Logger) as Boolean {
    var sel = new NoteSelector();
    sel.setIndex(0);
    sel.previous();
    Test.assertEqual(sel.getCurrentIndex(), NoteData.getNoteCount() - 1);
    return true;
}
