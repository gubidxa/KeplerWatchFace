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
    protected var color = null;
    private var referenceX = null;
    private var referenceY = null;

    function initialize(params as Dictionary) {
        Drawable.initialize(params);

        referenceX = params[:refX] as Number;
        referenceY = params[:refY] as Number;
        setColor(params[:color]);
        setIconsFont(params[:iconsFont]);
        setInfoFont(params[:infoFont]);
    }

    function setIconsFont(newIconsFont) {
        iconsFont = newIconsFont;
    }

    function setInfoFont(newInfoFont) {
        infoFont = newInfoFont;
    }

    function setColor(newColor) {
        color = newColor;
    }

    function draw(dc as Dc) as Void {
        var iconDim = dc.getTextDimensions(iconText, iconsFont);
        var infoDim = dc.getTextDimensions(infoText, infoFont);

        width = iconDim[0] + infoDim[0];
        height = iconDim[1];

        var locX = dc.getWidth() * referenceX - width / 2.0;
        var locY = dc.getHeight() * referenceY;

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(locX, locY, iconsFont, iconText, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(locX + iconDim[0], locY, infoFont, infoText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}