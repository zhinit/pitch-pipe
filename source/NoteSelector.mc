import Toybox.Lang;

class NoteSelector {

    private var _currentIndex as Number;

    function initialize() {
        _currentIndex = NoteData.A4_INDEX;
    }

    function next() as Void {
        _currentIndex++;
        if (_currentIndex >= NoteData.getNoteCount()) {
            _currentIndex = 0;
        }
    }

    function previous() as Void {
        _currentIndex--;
        if (_currentIndex < 0) {
            _currentIndex = NoteData.getNoteCount() - 1;
        }
    }

    function getCurrentIndex() as Number {
        return _currentIndex;
    }

    function setIndex(index as Number) as Void {
        _currentIndex = index;
    }

}
