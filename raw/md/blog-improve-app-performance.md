# Blog: How to Improve Your Connect IQ Application Performance

Source: https://www.garmin.com/en-US/blog/developer/improve-your-app-performance/
Fetched: 2026-06-14

## Application Lifecycle

The core lifecycle sequence: initialize → onLayout → onShow → onUpdate.

"The application is always created from scratch when it is displayed, and all
these methods are called upon."

Only the onUpdate method runs during display refreshes.

## Performance Drawing Patterns

### onUpdate Timing

- Watch faces: once per minute normally
- Active viewing: once per second when looking at the watch
- Connect IQ 2.3+: can implement onPartialUpdate for seconds updates

### Graphics Performance

Complex rendering can take up to 700 milliseconds per screen, causing battery
drain and unresponsiveness since the system cannot switch applications until
drawing completes.

## Optimization Strategy

Pre-calculate complex values in onLayout, then store results in memory for use
during onUpdate calls. This ensures the fastest possible UI refresh.

## Memory Constraints

Device-specific memory limits vary by application type — fēnix 5 allows 92 KB
for watch faces but only 28 KB for data fields.
