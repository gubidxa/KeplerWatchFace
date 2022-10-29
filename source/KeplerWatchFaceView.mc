import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

import Toybox.ActivityMonitor;

class KeplerWatchFaceView extends WatchUi.WatchFace {

    private var background as Background;
    private var clockView as ClockDrawable;
    private var batteryIndicator as BatteryIndicator;
    private var stepsIndicator as StepsIndicator;
    private var caloriesIndicator as CaloriesIndicator;
    private var bluetoothIndicator as BluetoothIndicator;

    function initialize() {
        WatchFace.initialize();

        var theme = Theme.getCurrent();

        background = new Background({
            :identifier => "Background",
            :color => theme.getBackgroundColor()
        });
        clockView = new ClockDrawable({ :identifier => "Clock"});
        batteryIndicator = new BatteryIndicator({
            :identifier => "Battery",
            :color => theme.getPrimaryColor(),
            :refX => 0.5,
            :refY => 0.05
        });
        stepsIndicator = new StepsIndicator({
            :identifier => "Steps",
            :color => theme.getSecondaryColor(),
            :refX => 0.25,
            :refY => 0.7
        });
        caloriesIndicator = new CaloriesIndicator({
            :identifier => "Calories",
            :color => theme.getSecondaryColor(),
            :refX => 0.75,
            :refY => 0.7
        });
        bluetoothIndicator = new BluetoothIndicator({
            :identifier => "Bluetooth",
            :color => 0xffffff,
            :refX => 0.5,
            :refY => 0.85
        });
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    function themeUpdated() as Void {
        try{
            var theme = Theme.getCurrent();
            background.setColor(theme.getBackgroundColor());
            batteryIndicator.setColor(theme.getPrimaryColor());
            stepsIndicator.setColor(theme.getSecondaryColor());
            caloriesIndicator.setColor(theme.getSecondaryColor());
        } catch (ex instanceof Lang.Exception) {
            System.println(ex.getErrorMessage());
            throw ex;
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        try{
            View.onUpdate(dc);
            background.draw(dc);
            clockView.draw(dc);
            batteryIndicator.draw(dc);
            stepsIndicator.draw(dc);
            caloriesIndicator.draw(dc);
            bluetoothIndicator.draw(dc);
        } catch (ex instanceof Lang.Exception) {
            System.println(ex.getErrorMessage());
            throw ex;
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
