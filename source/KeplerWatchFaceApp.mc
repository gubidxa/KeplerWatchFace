import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class KeplerWatchFaceApp extends Application.AppBase {

    private var keplerWatchFaceView as KeplerWatchFaceView;

    function initialize() {
        AppBase.initialize();
        keplerWatchFaceView = new KeplerWatchFaceView();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ keplerWatchFaceView ] as Array<Views or InputDelegates>;
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() as Void {
        keplerWatchFaceView.themeUpdated();
        WatchUi.requestUpdate();
    }
}

function getApp() as KeplerWatchFaceApp {
    return Application.getApp() as KeplerWatchFaceApp;
}
