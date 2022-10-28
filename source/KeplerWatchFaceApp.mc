import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class KeplerWatchFaceApp extends Application.AppBase {

    private var lastTheme = -1;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new KeplerWatchFaceView() ] as Array<Views or InputDelegates>;
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() as Void {
        updateTheme();
        WatchUi.requestUpdate();
    }

    private function updateTheme() {
        var primaryColor = getApp().getProperty("PrimaryColor") as Number;
        var secondaryColor = getApp().getProperty("SecondaryColor") as Number;
        var theme = getApp().getProperty("Theme") as Number;
        if (lastTheme != theme) {
            lastTheme = theme;
            switch (lastTheme) {
                case 1:
                    primaryColor = 0xfea65c;
                    secondaryColor = 0xffffaa;
                    break;
                case 2:
                    primaryColor = 0xffaaff;
                    secondaryColor = 0xff55ff;
                    break;
                case 3:
                    primaryColor = 0xfaa69c;
                    secondaryColor = 0xffffaa;
                    break;
                default:
                    primaryColor = 0x55ffff;
                    secondaryColor = 0x00ffaa;
            }
        }
        getApp().setProperty("PrimaryColor", primaryColor);
        getApp().setProperty("SecondaryColor", secondaryColor);
    }
}

function getApp() as KeplerWatchFaceApp {
    return Application.getApp() as KeplerWatchFaceApp;
}