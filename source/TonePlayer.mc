import Toybox.Attention;
import Toybox.Lang;
import Toybox.Timer;

class TonePlayer {

    private var _timer as Timer.Timer;
    private var _isPlaying as Boolean = false;
    private var _currentFreq as Number = 0;
    private var _hasTone as Boolean;

    function initialize() {
        _timer = new Timer.Timer();
        _hasTone = (Attention has :playTone) && (Attention has :ToneProfile);
    }

    function play(freq as Number) as Void {
        if (!_hasTone) {
            return;
        }
        _currentFreq = freq;
        _isPlaying = true;
        playOnce();
        _timer.start(method(:playOnce), 200, true);
    }

    function stop() as Void {
        _timer.stop();
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
            if (_isPlaying) {
                _timer.stop();
            }
            play(freq);
        }
    }

    function isPlaying() as Boolean {
        return _isPlaying;
    }

    function hasToneSupport() as Boolean {
        return _hasTone;
    }

    function playOnce() as Void {
        if (_hasTone) {
            var tone = new Attention.ToneProfile(_currentFreq, 250);
            Attention.playTone({:toneProfile => [tone]});
        }
    }

}
