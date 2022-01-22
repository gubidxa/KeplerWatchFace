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
}