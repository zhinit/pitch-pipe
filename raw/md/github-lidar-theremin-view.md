# Lidar Theremin — LidarThereminView.mc

Source: https://github.com/garmin/connectiq-apps/blob/master/device-apps/lidar-theremin/source/LidarThereminView.mc
Fetched: 2026-06-14
Author: Garmin Ltd. (official sample app)

```monkeyc
//
// Copyright 2015-2019 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Attention;

class LidarThereminView extends WatchUi.View {

    public const LIDAR_NO_DEVICE = 0;
    public const LIDAR_NO_MEASUREMENT = 1;
    public const LIDAR_MEASUREMENT_FAILED = 2;

    private var _distanceLabel;
    private var _distanceText = "No device...";
    private var _model;
    private var _strings;

    public function initialize() {
        WatchUi.View.initialize();
        _model = new LidarThereminModel();
        _strings = [
            WatchUi.loadResource(Rez.Strings.NoDevice),
            WatchUi.loadResource(Rez.Strings.NoMeasurement),
            WatchUi.loadResource(Rez.Strings.MeasurementFailed)
        ];
    }

    public function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        _distanceLabel = findDrawableById("DistanceLabel");
    }

    public function onUpdate(dc) {
        var lastDistanceUpdate = _model.getUpdateTime();
        if( lastDistanceUpdate == null or
            lastDistanceUpdate.subtract(Time.now()).value() > 10 ) {
            _distanceText = _strings[ LIDAR_NO_DEVICE ];
        }
        _distanceLabel.setText(_distanceText);
        View.onUpdate(dc);
    }

    public function onMeasurement(model) {
        _model = model;
        var distance = model.getDistance();
        if (distance == LIDAR_NO_DEVICE) {
            _distanceText = _strings[ LIDAR_NO_DEVICE ];
        } else if (distance == LIDAR_NO_MEASUREMENT) {
            _distanceText = _strings[ LIDAR_NO_MEASUREMENT ];
        } else {
            _distanceText = Lang.format("$1$ cm", [distance]);
        }
        WatchUi.requestUpdate();
    }

}
```
