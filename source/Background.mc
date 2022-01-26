import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize(params) {
        Drawable.initialize(params);
    }

    function draw(dc as Dc) as Void {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, getApp().getProperty("BackgroundColor") as Number);
        dc.clear();
        var cx = dc.getWidth() / 2;
        var cy = dc.getHeight() / 2;
        dc.setPenWidth(3);
        dc.setColor(getApp().getProperty("PrimaryColor") as Number, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, cx - 7);
        dc.setColor(getApp().getProperty("SecondaryColor") as Number, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(cx, cy, cx - 3);
        dc.setPenWidth(1);
    }
}
