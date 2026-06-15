import Toybox.Lang;
import Toybox.Test;

(:test)
function testInitiallyNotPlaying(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    Test.assertEqual(player.isPlaying(), false);
    return true;
}

(:test)
function testPlaySetsPlaying(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.play(440);
    var result = player.isPlaying();
    player.stop();
    Test.assertEqual(result, true);
    return true;
}

(:test)
function testStopClearsPlaying(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.play(440);
    player.stop();
    Test.assertEqual(player.isPlaying(), false);
    return true;
}

(:test)
function testToggleSameFreqStops(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.toggle(440);
    player.toggle(440);
    Test.assertEqual(player.isPlaying(), false);
    return true;
}

(:test)
function testToggleDifferentFreqKeepsPlaying(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.toggle(440);
    player.toggle(262);
    var result = player.isPlaying();
    player.stop();
    Test.assertEqual(result, true);
    return true;
}

(:test)
function testStopWhenNotPlayingIsSafe(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.stop();
    Test.assertEqual(player.isPlaying(), false);
    return true;
}

(:test)
function testPlayWhileAlreadyPlaying(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.play(440);
    player.play(262);
    var result = player.isPlaying();
    player.stop();
    Test.assertEqual(result, true);
    return true;
}

(:test)
function testDoubleStopIsSafe(logger as Test.Logger) as Boolean {
    var player = new TonePlayer();
    player.play(440);
    player.stop();
    player.stop();
    Test.assertEqual(player.isPlaying(), false);
    return true;
}
