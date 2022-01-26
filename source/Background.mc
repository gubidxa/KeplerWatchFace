import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    // private var bgImage = null;
    private var primaryColor = 0x55ffff;
    private var secondaryColor = 0x00ffaa;
    private var lastTheme = 0;

    function initialize(params) {
        Drawable.initialize(params);
        // bgImage = params[:bgImage];
    }

    function draw(dc as Dc) as Void {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, 0x000000/*getApp().getProperty("BackgroundColor") as Number*/);
        dc.clear();
        /* if (bgImage != null) {
            dc.drawBitmap(0, 0, bgImage);
        } */
        updateColors();

        dc.setPenWidth(2);
        dc.setColor(primaryColor, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(120, 120, 114);
        dc.setColor(secondaryColor, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(120, 120, 118);
    }

    private function updateColors() {
        var theme = getApp().getProperty("Theme") as Number;
        if (lastTheme != theme) {
            lastTheme = theme;
            switch (lastTheme) {
                case 1:
                    primaryColor = 0x0055aa;
                    secondaryColor = 0xffffaa;
                    break;
                default:
                    primaryColor = 0x55ffff;
                    secondaryColor = 0x00ffaa;
            }
        }
    }

}
