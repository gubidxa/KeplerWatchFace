import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize(params) {
        Drawable.initialize(params);
    }

    function draw(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_TRANSPARENT, getApp().getProperty("BackgroundColor") as Number);
        var theme = getApp().getProperty("Theme") as Number;
        var image = WatchUi.loadResource(Rez.Drawables.Kepler22b);
        switch (theme) {
            case 1:
                image = WatchUi.loadResource(Rez.Drawables.Kepler45b);
                break;
            case 2:
                image = WatchUi.loadResource(Rez.Drawables.Kepler56d);
                break;
            case 3:
                image = WatchUi.loadResource(Rez.Drawables.Kepler68b);
                break;
            default:
                image = WatchUi.loadResource(Rez.Drawables.Kepler22b);
        }
        var cy = (dc.getHeight() / 2) - ((image.getHeight() / 2) + 12);
        dc.drawBitmap(4, cy, image);
    }
}
