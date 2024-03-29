import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi;

class BluetoothIndicator extends IconIndicator {

    private var icon = null;

    function initialize(params as Dictionary) {
        IconIndicator.initialize(params);
        iconText = "b";
        infoText = "";
    }

    function draw(dc as Dc) as Void {
        var phoneConnected = System.getDeviceSettings().phoneConnected;
        iconText = phoneConnected ? "b" : "B";
        color = phoneConnected ? 0xffffff : 0xaaaaaa;
        IconIndicator.draw(dc);
    }
}
