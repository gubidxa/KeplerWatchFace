import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

import Toybox.ActivityMonitor;

class KeplerWatchFaceView extends WatchUi.WatchFace {

    private const ICONS_FONT = WatchUi.loadResource(Rez.Fonts.IconsFont);
    private const INFO_FONT = WatchUi.loadResource(Rez.Fonts.PrimaryIndicatorFont);

    private var background = null;
    private var clockView = null;
    private var batteryIndicator = null;
    private var stepsIndicator = null;
    private var caloriesIndicator = null;
    private var bluetoothIndicator = null;

    function initialize() {
        WatchFace.initialize();

        background = new Background({
            :identifier => "Background"
        });
        clockView = new ClockDrawable({ :identifier => "Clock"});
        batteryIndicator = new BatteryIndicator({
            :identifier => "Battery",
            :color => getApp().getProperty("PrimaryColor") as Number,
            :refX => 0.5,
            :refY => 0.05,
            :iconsFont => ICONS_FONT,
            :infoFont => INFO_FONT
        });
        stepsIndicator = new StepsIndicator({
            :identifier => "Steps",
            :color => getApp().getProperty("SecondaryColor") as Number,
            :refX => 0.25,
            :refY =>0.7,
            :iconsFont => ICONS_FONT,
            :infoFont => INFO_FONT
        });
        caloriesIndicator = new CaloriesIndicator({
            :identifier => "Calories",
            :color => getApp().getProperty("SecondaryColor") as Number,
            :refX => 0.75,
            :refY =>0.7,
            :iconsFont => ICONS_FONT,
            :infoFont => INFO_FONT
        });
        bluetoothIndicator = new BluetoothIndicator({
            :identifier => "Bluetooth",
            :color => 0xffffff,
            :refX => 0.5,
            :refY => 0.85,
            :iconsFont => ICONS_FONT,
            :infoFont => INFO_FONT
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

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        background.draw(dc);
        clockView.draw(dc);
        batteryIndicator.setColor(getApp().getProperty("PrimaryColor") as Number);
        batteryIndicator.draw(dc);
        stepsIndicator.setColor(getApp().getProperty("SecondaryColor") as Number);
        stepsIndicator.draw(dc);
        caloriesIndicator.setColor(getApp().getProperty("SecondaryColor") as Number);
        caloriesIndicator.draw(dc);
        bluetoothIndicator.draw(dc);
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
