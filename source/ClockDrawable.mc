import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class ClockDrawable extends WatchUi.Drawable {

    private const DATE_FONT = WatchUi.loadResource(Rez.Fonts.DateFont);
    private const HOURS_FONT = WatchUi.loadResource(Rez.Fonts.HoursFont);
    private const MINUTES_FONT = WatchUi.loadResource(Rez.Fonts.MinutesFont);

    private const MONTHS_FMT = [
        WatchUi.loadResource(Rez.Strings.MonthJan),
        WatchUi.loadResource(Rez.Strings.MonthFeb),
        WatchUi.loadResource(Rez.Strings.MonthMar),
        WatchUi.loadResource(Rez.Strings.MonthApr),
        WatchUi.loadResource(Rez.Strings.MonthMay),
        WatchUi.loadResource(Rez.Strings.MonthJun),
        WatchUi.loadResource(Rez.Strings.MonthJul),
        WatchUi.loadResource(Rez.Strings.MonthAug),
        WatchUi.loadResource(Rez.Strings.MonthSep),
        WatchUi.loadResource(Rez.Strings.MonthOct),
        WatchUi.loadResource(Rez.Strings.MonthNov),
        WatchUi.loadResource(Rez.Strings.MonthDec)
    ];

    private const DAYS_FMT = [
        WatchUi.loadResource(Rez.Strings.DaySun),
        WatchUi.loadResource(Rez.Strings.DayMon),
        WatchUi.loadResource(Rez.Strings.DayTue),
        WatchUi.loadResource(Rez.Strings.DayWed),
        WatchUi.loadResource(Rez.Strings.DayThu),
        WatchUi.loadResource(Rez.Strings.DayFri),
        WatchUi.loadResource(Rez.Strings.DaySat)
    ];

    private var deviceSettings = System.getDeviceSettings();
    private var xOffset = 1;

    function initialize(params as Dictionary) {
        Drawable.initialize(params);
        xOffset = deviceSettings.screenHeight == 218 && deviceSettings.screenWidth == 218 ? 5 : 1;
    }

    function draw(dc as Dc) as Void {
        var clockTime = System.getClockTime();

        var hour = clockTime.hour;
        hour = (!deviceSettings.is24Hour && hour > 12)?
            hour - 12 : hour;

        var hourData = hour.format("%02d");
        var minData = clockTime.min.format("%02d");

        var hoursDim = dc.getTextDimensions(hourData, HOURS_FONT);
        var minutesDim = dc.getTextDimensions(minData, MINUTES_FONT);

        var hoursX = dc.getWidth() - (minutesDim[0] + 5);
        var hoursY = dc.getHeight() * 0.45 - hoursDim[1] / 2.0 - xOffset;

        var minutesX = dc.getWidth() - 5;
        var minutesY = dc.getHeight() * 0.45 - minutesDim[1] / 2.0 - xOffset;

        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dayOfWeek = DAYS_FMT[today.day_of_week - 1];
        var month = MONTHS_FMT[today.month - 1];
        var dateData = Lang.format("$1$ $2$ $3$", [dayOfWeek, today.day.format("%02d"), month]);

        var dateDim = dc.getTextDimensions(dateData, DATE_FONT);
        var dateX = dc.getWidth() - 5;
        var dateY = (dc.getHeight() * 0.6 - dateDim[1] / 2.0) + 3;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dateX, dateY, DATE_FONT, dateData, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(hoursX, hoursY, HOURS_FONT, hourData, Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(minutesX, minutesY, MINUTES_FONT, minData, Graphics.TEXT_JUSTIFY_RIGHT);
    }
}
