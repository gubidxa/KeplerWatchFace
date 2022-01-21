import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class ClockDrawable extends WatchUi.Drawable {

    private var hoursFont = null;
    private var minutesFont = null;

    function initialize(params) {
        Drawable.initialize(params);

        hoursFont = WatchUi.loadResource(Rez.Fonts.HoursFont);
        minutesFont = WatchUi.loadResource(Rez.Fonts.MinutesFont);
    }

    function draw(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var hours = clockTime.hour.format("%02d");
        var minutes = clockTime.min.format("%02d");

        var hoursDim = dc.getTextDimensions(hours, hoursFont);
        var hoursX = dc.getWidth() * 0.485;
        var hoursY = dc.getHeight() * 0.48 - hoursDim[1] / 2.0;

        var minutesDim = dc.getTextDimensions(minutes, minutesFont);
        var minutesX = dc.getWidth() * 0.515;
        var minutesY = dc.getHeight() * 0.48 - minutesDim[1] / 2.0;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hoursX, hoursY, hoursFont, hours, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(minutesX, minutesY, minutesFont, minutes, Graphics.TEXT_JUSTIFY_LEFT);
    }
}