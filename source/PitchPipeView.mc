import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PitchPipeView extends WatchUi.View {

    private var _selector as NoteSelector;
    private var _player as TonePlayer;
    private var _centerX as Number = 0;
    private var _centerY as Number = 0;
    private var _noteY as Number = 0;
    private var _freqY as Number = 0;
    private var _arcRadius as Number = 0;
    private var _hintUpY as Number = 0;
    private var _hintDownY as Number = 0;

    private const COS_TABLE as Array<Number> = [
        0, 500, 866, 1000, 866, 500, 0, -500, -866, -1000, -866, -500
    ];
    private const SIN_TABLE as Array<Number> = [
        1000, 866, 500, 0, -500, -866, -1000, -866, -500, 0, 500, 866
    ];

    function initialize(selector as NoteSelector, player as TonePlayer) {
        View.initialize();
        _selector = selector;
        _player = player;
    }

    function onLayout(dc as Dc) as Void {
        var w = dc.getWidth();
        var h = dc.getHeight();
        _centerX = w / 2;
        _centerY = h / 2;

        var noteHeight = dc.getFontHeight(Graphics.FONT_LARGE);
        _noteY = _centerY - noteHeight / 2 - 8;
        _freqY = _noteY + noteHeight + 4;

        _arcRadius = w / 2 - 14;
        _hintUpY = 20;
        _hintDownY = h - 20 - dc.getFontHeight(Graphics.FONT_XTINY);
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        var index = _selector.getCurrentIndex();
        var playing = _player.isPlaying();
        var noteInOctave = index % NoteData.NOTE_COUNT;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        drawNoteArc(dc, noteInOctave, playing);

        var noteColor = playing ? Graphics.COLOR_BLUE : 0xCC8888;
        dc.setColor(noteColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            _centerX, _noteY,
            Graphics.FONT_LARGE,
            NoteData.getDisplayName(index),
            Graphics.TEXT_JUSTIFY_CENTER
        );

        dc.setColor(0x885555, Graphics.COLOR_TRANSPARENT);
        var freqText = NoteData.getFrequency(index) + " Hz";
        if (!_player.hasToneSupport()) {
            freqText = "No tone support";
        } else if (!System.getDeviceSettings().tonesOn) {
            freqText = "Enable Alert Tones";
        }
        dc.drawText(
            _centerX, _freqY,
            Graphics.FONT_TINY,
            freqText,
            Graphics.TEXT_JUSTIFY_CENTER
        );

        drawHints(dc, index);
    }

    function onHide() as Void {
        _player.stop();
    }

    private function drawHints(dc as Dc, index as Number) as Void {
        dc.setColor(0x664444, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            _centerX, _hintUpY,
            Graphics.FONT_XTINY,
            NoteData.getDisplayName(prevIndex(index)),
            Graphics.TEXT_JUSTIFY_CENTER
        );
        dc.drawText(
            _centerX, _hintDownY,
            Graphics.FONT_XTINY,
            NoteData.getDisplayName(nextIndex(index)),
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    private function drawNoteArc(dc as Dc, noteInOctave as Number, playing as Boolean) as Void {
        for (var i = 0; i < 12; i++) {
            var dx = COS_TABLE[i] * _arcRadius / 1000;
            var dy = SIN_TABLE[i] * _arcRadius / 1000;
            var px = _centerX + dx;
            var py = _centerY - dy;

            if (i == noteInOctave) {
                dc.setColor(playing ? Graphics.COLOR_BLUE : 0xCC8888, Graphics.COLOR_TRANSPARENT);
                dc.fillCircle(px, py, 5);
            } else {
                dc.setColor(0x553333, Graphics.COLOR_TRANSPARENT);
                dc.fillCircle(px, py, 2);
            }
        }
    }

    private function nextIndex(index as Number) as Number {
        return (index + 1) % NoteData.getNoteCount();
    }

    private function prevIndex(index as Number) as Number {
        return index == 0 ? NoteData.getNoteCount() - 1 : index - 1;
    }

}
