# Lidar Theremin — LidarThereminDelegate.mc

Source: https://github.com/garmin/connectiq-apps/blob/master/device-apps/lidar-theremin/source/LidarThereminDelegate.mc
Fetched: 2026-06-14
Author: Garmin Ltd. (official sample app)

```monkeyc
//
// Copyright 2015-2019 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;

// Input delegate for the Lidar. It doesn't do much because
// the Lidar is the input
class LidarThereminDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }
}
```
