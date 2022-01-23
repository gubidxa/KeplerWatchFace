import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    private var bgImage = null;

    function initialize(params) {
        Drawable.initialize(params);
        bgImage = params[:bgImage];
    }

    function draw(dc as Dc) as Void {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, getApp().getProperty("BackgroundColor") as Number);
        dc.clear();
        if (bgImage != null) {
            dc.drawBitmap(0, 0, bgImage);
        }
    }

}
