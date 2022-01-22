import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;

class BatteryIndicator extends IconIndicator {

    function initialize(params as Dictionary) {
        IconIndicator.initialize(params);
        iconText = "m";
    }

    function draw(dc as Dc) as Void {
        var stats = System.getSystemStats();
        var battery = stats.battery;

        if (Utils.checkVersion([3, 0, 0]) && stats.charging)  {
            iconText = "l";
        } else if (battery >= 90) {
            iconText = "h";
        } else if (battery <= 20) {
            iconText = "k";
        }

        infoText = Lang.format("$1$%", [battery.format("%d")]);
        IconIndicator.draw(dc);
    }
}