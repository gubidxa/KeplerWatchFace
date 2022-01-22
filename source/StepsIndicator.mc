import Toybox.Graphics;
import Toybox.ActivityMonitor;

class StepsIndicator extends IconIndicator {

    private var refX = null;
    private var refY = null;

    function initialize(params as Dictionary) {
        refX = params[:refX] as Number;
        refY = params[:refY] as Number;
        color = params[:color];
        iconText = "s";
        infoText = "0";
        
        IconIndicator.initialize(params);
    }

    function draw(dc as Dc) as Void {
        iconDim = dc.getTextDimensions(iconText, iconsFont);
        var infoDim = dc.getTextDimensions(infoText, infoFont);

        width = iconDim[0] + infoDim[0];
        height = iconDim[1];

        locX = dc.getWidth() * refX - width / 2.0;
        locY = dc.getHeight() * refY;
        infoText = ActivityMonitor.getInfo().steps.format("%d");
        IconIndicator.draw(dc);
    }

}