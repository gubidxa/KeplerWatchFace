import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class IconIndicator extends WatchUi.Drawable {

    protected var iconText = null;
    protected var infoText = "";
    private var iconsFont = null;
    private var infoFont = null;
    private var color = null;
    private var refX = null;
    private var refY = null;

    function initialize(params as Dictionary) {
        Drawable.initialize(params);

        refX = params[:refX] as Number;
        refY = params[:refY] as Number;
        color = params[:color];
    
        iconsFont = WatchUi.loadResource(Rez.Fonts.IconsFont);
        infoFont = WatchUi.loadResource(Rez.Fonts.PrimaryIndicatorFont);
    }

    function draw(dc as Dc) as Void {
        var iconDim = dc.getTextDimensions(iconText, iconsFont);
        var infoDim = dc.getTextDimensions(infoText, infoFont);

        width = iconDim[0] + infoDim[0];
        height = iconDim[1];

        locX = dc.getWidth() * refX - width / 2.0;
        locY = dc.getHeight() * refY;

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(locX, locY, iconsFont, iconText, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(locX + iconDim[0], locY, infoFont, infoText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}