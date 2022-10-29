import Toybox.WatchUi;

class Theme {
    private var backgroundColor = 0xffffff;
    private var primaryColor = 0x55ffff;
    private var secondaryColor = 0x00ffaa;

    function initialize(params as Dictionary) {
        setBackgroundColor(params["backgroundColor"]);
        setPrimaryColor(params["primaryColor"]);
        setSecondaryColor(params["secondaryColor"]);
    }

    function getBackgroundColor() as Number {
        return backgroundColor;
    }

    function setBackgroundColor(newColor as String or Number) {
        backgroundColor = transformValue(newColor);
    }

    function getPrimaryColor() as Number{
        return primaryColor;
    }

    function setPrimaryColor(newColor as String or Number) {
        primaryColor = transformValue(newColor);
    }

    function getSecondaryColor() as Number  {
        return secondaryColor;
    }

    function setSecondaryColor(newColor as String or Number) {
        secondaryColor = transformValue(newColor);
    }

    private function transformValue(value as String or Number) as Number {
        if (value instanceof Number) {
            return value;
        }
        return value.toNumberWithBase(16);
    }

    static function getCurrent() as Theme {
        var App = getApp();
        var themeIndex = 0;
        var themes = WatchUi.loadResource(Rez.JsonData.Themes);
        try{
            themeIndex = App.getProperty("Theme") as Number;
        } catch (ex) {
            App.setProperty("Theme", themeIndex) as Number;
        }
        return new Theme(themes[themeIndex]);
    }
}
