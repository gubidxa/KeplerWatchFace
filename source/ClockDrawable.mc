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
    private var daysFormat = null;
    private var monthsFormat = null;

    function initialize(params) {
        Drawable.initialize(params);

        dateFont = WatchUi.loadResource(Rez.Fonts.DateFont);
        hoursFont = WatchUi.loadResource(Rez.Fonts.HoursFont);
        minutesFont = WatchUi.loadResource(Rez.Fonts.MinutesFont);
        daysFormat = WatchUi.loadResource(Rez.JsonData.DaysFmt);
        monthsFormat = WatchUi.loadResource(Rez.JsonData.MonthsFmt);
    }

    function draw(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var hours = clockTime.hour.format("%02d");
        var minutes = clockTime.min.format("%02d");

        var hoursDim = dc.getTextDimensions(hours, hoursFont);
        var hoursX = dc.getWidth() * 0.485;
        var hoursY = dc.getHeight() * 0.45 - hoursDim[1] / 2.0;

        var minutesDim = dc.getTextDimensions(minutes, minutesFont);
        var minutesX = dc.getWidth() * 0.515;
        var minutesY = dc.getHeight() * 0.45 - minutesDim[1] / 2.0;

        var todayInfo = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dayOfWeek = daysFormat[todayInfo.day_of_week - 1];
        var month = monthsFormat[todayInfo.month - 1];
        var today = Lang.format("$1$ $2$ $3$", [dayOfWeek, todayInfo.day.format("%02d"), month]);

        var dateDim = dc.getTextDimensions(today, dateFont);
        var dateX = dc.getWidth() * 0.5;
        var dateY = (dc.getHeight() * 0.60 - dateDim[1] / 2.0) + 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dateX, dateY, dateFont, today, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(hoursX, hoursY, hoursFont, hours, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(minutesX, minutesY, minutesFont, minutes, Graphics.TEXT_JUSTIFY_LEFT);
    }
}