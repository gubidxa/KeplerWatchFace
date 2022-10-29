import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class IconIndicator extends WatchUi.Drawable {

    private const ICONS_FONT = WatchUi.loadResource(Rez.Fonts.IconsFont);
    private const INFO_FONT = WatchUi.loadResource(Rez.Fonts.PrimaryIndicatorFont);

    protected var iconText = "";
    protected var infoText = "";
    protected var color = 0xffffff;
    private var referenceX as Numeric = 0;
    private var referenceY as Numeric = 0;

    function initialize(params as Dictionary) {
        Drawable.initialize(params);

        referenceX = params[:refX];
        referenceY = params[:refY];
        setColor(params[:color]);
    }

    function setColor(newColor as Number) {
        color = newColor;
    }

    function draw(dc as Dc) as Void {
        var iconDim = dc.getTextDimensions(iconText, ICONS_FONT);
        var infoDim = dc.getTextDimensions(infoText, INFO_FONT);

        width = iconDim[0] + infoDim[0];
        height = iconDim[1];

        locX = dc.getWidth() * referenceX - width / 2.0;
        locY = dc.getHeight() * referenceY;

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(locX, locY, ICONS_FONT, iconText, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(locX + iconDim[0], locY, INFO_FONT, infoText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
