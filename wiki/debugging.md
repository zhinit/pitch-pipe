# Debugging and Profiling

## System.println

The simplest debugging tool. In the simulator, output appears in the console.
On a physical device, output writes to `/GARMIN/APPS/LOGS/<APPNAME>.TXT` —
this file must be created manually before it will capture output.
(source: forum-new-developer-faq.md)

```monkey
import Toybox.System;

function onUpdate(dc as Dc) as Void {
    System.println("onUpdate called");
}
```

In VS Code, check the **Output** view (not Terminal) and select the app from
the output dropdown. (source: forum-simulator-how-to-run.md)

## Crash Logs

**App crashes** produce `/GARMIN/APPS/LOGS/CIQ_LOG.YML` containing call
stacks. The app quits or shows an "IQ!" icon without rebooting the device.
(source: forum-new-developer-faq.md)

**Device crashes** produce `ERR_LOG.TXT` in `/GARMIN` or `/GARMIN/DEBUG`,
indicating firmware issues. These cause reboots or freezes.
(source: forum-new-developer-faq.md)

Log files exceeding 5 KB automatically archive to `.BAK` files (~10 KB
maximum practical space). (source: forum-new-developer-faq.md)

## Debug vs. Release Annotations

The `(:debug)` annotation marks code to be excluded from release builds.
`(:release)` marks code included only in release builds. The
`excludeAnnotations` mechanism in `monkey.jungle` controls which annotations
are stripped. (source: forum-remove-logging-release.md)

```monkey
(:debug)
function debugLog(msg as String) as Void {
    System.println(msg);
}
```

Annotations only work at the function or class level — they cannot wrap
arbitrary statement blocks. Multiple annotations combine on one line:
`(:debug :background)`. (source: forum-remove-logging-release.md)

## Simulator Memory Monitoring

The simulator provides tools to monitor peak memory and peak object count
during execution. Apps that run fine in the simulator may still exceed memory
limits on real hardware — the simulator provides more memory than the device.
(source: forum-garbage-collection.md, forum-simulator-feature-request.md)

## Compiler Debug Logging

The new compiler toolchain supports debug logging options
(source: blog-optimal-monkey-c.md):

| Option               | Argument  | Purpose                                |
|----------------------|-----------|----------------------------------------|
| `--debug-log-level`  | 0–3       | Verbosity: errors only → verbose debug |
| `--debug-log-output` | File path | Log file location                      |
| `--debug-log-device` | Device ID | Filter logs for a specific device      |

## Compiler Optimization

The `-O` flag controls optimization level (source: blog-optimal-monkey-c.md):

| Level | Effect                                    |
|-------|-------------------------------------------|
| 0     | No optimization                           |
| 1     | Basic optimization                        |
| 2     | Release-mode; maximum code size reduction |

Optimizations include constant folding, constant substitution, and branch
elimination.

## Side-Loading for On-Device Testing

1. Command Palette → **Monkey C: Build for Device** (or `monkeyc` CLI)
2. Connect the watch via USB
3. Copy the `.prg` file to `GARMIN/APPS/` on the device
4. Disconnect the device

(source: forum-new-developer-faq.md)

To capture `System.println` output on device, manually create
`/GARMIN/APPS/LOGS/<APPNAME>.TXT` before running the app.
(source: forum-new-developer-faq.md)

## App Settings Caveat

Side-loaded apps cannot access app settings, because settings depend on the
Connect IQ App Store connection. To test settings, submit the app in beta
status. (source: forum-new-developer-faq.md)

See also: [[unit-testing]], [[simulator]], [[monkey-c]]
