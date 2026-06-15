import Toybox.Attention;
import Toybox.Lang;

class TonePlayer {

    private var _isPlaying as Boolean = false;
    private var _currentFreq as Number = 0;
    private var _hasTone as Boolean;

    function initialize() {
        _hasTone = (Attention has :playTone) && (Attention has :ToneProfile);
    }

    function play(freq as Number) as Void {
        if (!_hasTone) {
            return;
        }
        _currentFreq = freq;
        _isPlaying = true;
        var tone = new Attention.ToneProfile(freq, 30000);
        Attention.playTone({:toneProfile => [tone]});
    }

    function stop() as Void {
        if (_isPlaying && _hasTone) {
            var cancel = new Attention.ToneProfile(50, 1);
            Attention.playTone({:toneProfile => [cancel]});
        }
        _isPlaying = false;
    }

    function toggle(freq as Number) as Void {
        if (_isPlaying && _currentFreq == freq) {
            stop();
        } else {
            play(freq);
        }
    }

    function isPlaying() as Boolean {
        return _isPlaying;
    }

    function hasToneSupport() as Boolean {
        return _hasTone;
    }

}
