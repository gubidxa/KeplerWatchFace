import Toybox.Graphics;
import Toybox.ActivityMonitor;
import Toybox.WatchUi;

class StepsIndicator extends IconIndicator {

    private var icon = null;

    function initialize(params as Dictionary) {
        IconIndicator.initialize(params);
        iconText = "s";
    }

    function draw(dc as Dc) as Void {
        infoText = ActivityMonitor.getInfo().steps.format("%d");
        IconIndicator.draw(dc);
    }
}