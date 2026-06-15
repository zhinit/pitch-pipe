import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class PitchPipeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void {
    }

    function onStop(state as Dictionary?) as Void {
    }

    function getInitialView() as [WatchUi.Views] or [WatchUi.Views, WatchUi.InputDelegates] {
        var selector = new NoteSelector();
        var player = new TonePlayer();
        return [new PitchPipeView(selector, player), new PitchPipeDelegate(selector, player)];
    }

}
