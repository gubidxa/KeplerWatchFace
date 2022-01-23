import Toybox.System;

module Utils {

    function checkVersion(minVersion as Array<Number>) as Boolean {
        var monkeyVersion = System.getDeviceSettings().monkeyVersion;

        return (
            monkeyVersion[0] >= minVersion[0] &&
            monkeyVersion[1] >= minVersion[1] &&
            monkeyVersion[2] >= minVersion[2]
        );
    }

    const MonthsSymb = [
        Rez.Strings.MonthJan,
        Rez.Strings.MonthFeb,
        Rez.Strings.MonthMar,
        Rez.Strings.MonthApr,
        Rez.Strings.MonthMay,
        Rez.Strings.MonthJun,
        Rez.Strings.MonthJul,
        Rez.Strings.MonthAug,
        Rez.Strings.MonthSep,
        Rez.Strings.MonthOct,
        Rez.Strings.MonthNov,
        Rez.Strings.MonthDec
    ];

    const DaysSymb = [
        Rez.Strings.DaySun,
        Rez.Strings.DayMon,
        Rez.Strings.DayTue,
        Rez.Strings.DayWed,
        Rez.Strings.DayThu,
        Rez.Strings.DayFri,
        Rez.Strings.DaySat
    ];
}