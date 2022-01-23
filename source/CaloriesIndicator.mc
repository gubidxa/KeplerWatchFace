import Toybox.Graphics;
import Toybox.ActivityMonitor;
import Toybox.WatchUi;

class CaloriesIndicator extends IconIndicator {

    private var icon = null;

    function initialize(params as Dictionary) {
        IconIndicator.initialize(params);
        iconText = "c";
    }

    function draw(dc as Dc) as Void {
        infoText = ActivityMonitor.getInfo().calories.format("%d");
        IconIndicator.draw(dc);
    }
}