import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class IconIndicator extends WatchUi.Drawable {

    protected var iconText = null;
    protected var infoText = null;
    protected var iconsFont = null;
    protected var infoFont = null;
    protected var color = null;
    protected var iconDim = [0, 0];

    function initialize(params as Dictionary) {
        Drawable.initialize(params);
    
        iconsFont = WatchUi.loadResource(Rez.Fonts.IconsFont);
        infoFont = WatchUi.loadResource(Rez.Fonts.PrimaryIndicatorFont);
    }

    function draw(dc as Dc) as Void {
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(locX, locY, iconsFont, iconText, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(locX + iconDim[0], locY, infoFont, infoText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}