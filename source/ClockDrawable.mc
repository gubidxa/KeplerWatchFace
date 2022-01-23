import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class ClockDrawable extends WatchUi.Drawable {

    private var dateFont = null;
    private var hoursFont = null;
    private var minutesFont = null;

    function initialize(params) {
        Drawable.initialize(params);

        dateFont = WatchUi.loadResource(Rez.Fonts.DateFont);
        hoursFont = WatchUi.loadResource(Rez.Fonts.HoursFont);
        minutesFont = WatchUi.loadResource(Rez.Fonts.MinutesFont);
    }

    function draw(dc as Dc) as Void {
        var clockTime = System.getClockTime();

        var hour = clockTime.hour;
        hour = (!System.getDeviceSettings().is24Hour && hour > 12)?
            hour - 12 : hour;

        var hourData = hour.format("%02d");
        var minData = clockTime.min.format("%02d");

        var hoursDim = dc.getTextDimensions(hourData, hoursFont);
        var hoursX = dc.getWidth() * 0.485;
        var hoursY = dc.getHeight() * 0.45 - hoursDim[1] / 2.0 - 1;

        var minutesDim = dc.getTextDimensions(minData, minutesFont);
        var minutesX = dc.getWidth() * 0.515;
        var minutesY = dc.getHeight() * 0.45 - minutesDim[1] / 2.0 - 1;

        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dayOfWeek = WatchUi.loadResource(Utils.DaysSymb[today.day_of_week - 1]);
        var month = WatchUi.loadResource(Utils.MonthsSymb[today.month - 1]);
        var dateData = Lang.format("$1$ $2$ $3$", [dayOfWeek, today.day.format("%02d"), month]);

        var dateDim = dc.getTextDimensions(dateData, dateFont);
        var dateX = dc.getWidth() * 0.5;
        var dateY = (dc.getHeight() * 0.60 - dateDim[1] / 2.0) + 3;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dateX, dateY, dateFont, dateData, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(hoursX, hoursY, hoursFont, hourData, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(minutesX, minutesY, minutesFont, minData, Graphics.TEXT_JUSTIFY_LEFT);
    }
}