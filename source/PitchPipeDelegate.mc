import Toybox.Lang;
import Toybox.WatchUi;

class PitchPipeDelegate extends WatchUi.BehaviorDelegate {

    private var _selector as NoteSelector;
    private var _player as TonePlayer;

    function initialize(selector as NoteSelector, player as TonePlayer) {
        BehaviorDelegate.initialize();
        _selector = selector;
        _player = player;
    }

    function onSelect() as Boolean {
        var freq = NoteData.getFrequency(_selector.getCurrentIndex());
        _player.toggle(freq);
        WatchUi.requestUpdate();
        return true;
    }

    function onNextPage() as Boolean {
        _selector.previous();
        if (_player.isPlaying()) {
            _player.play(NoteData.getFrequency(_selector.getCurrentIndex()));
        }
        WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() as Boolean {
        _selector.next();
        if (_player.isPlaying()) {
            _player.play(NoteData.getFrequency(_selector.getCurrentIndex()));
        }
        WatchUi.requestUpdate();
        return true;
    }


}
