# Monkey Types

Monkey Types is the gradual type system for [[monkey-c]], introduced in
Connect IQ 4. Type annotations are compile-time only — they add zero runtime
cost. (source: blog-road-to-strict-typing.md)

## Type-Check Levels

| Level           | Behavior                                                    |
|-----------------|-------------------------------------------------------------|
| **None**        | No type checking (`-l 0`)                                   |
| **Gradual**     | Checks typed code interactions; untyped code unchecked. Default. |
| **Informative** | Warns about untyped code; checks typed interactions         |
| **Strict**      | All definitions must be explicitly typed                    |

The level is set via the `-l` compiler flag or in VS Code workspace settings.
The `project.typecheck` setting in `monkey.jungle` is only used when the VS
Code extension's typecheck setting is "default."
(source: blog-road-to-strict-typing.md, blog-optimal-monkey-c.md)

Strict typing makes greatest sense for new codebases. Existing stable projects
may benefit from gradual checking without full refactoring.
(source: blog-road-to-strict-typing.md)

## Annotation Syntax

The `as` keyword annotates variables, parameters, and return types:

```monkey
var timeLabel as WatchUi.Text?;

function drawHeartRate(dc as Dc, heartRate as Number) as Void {
    // ...
}
```

(source: blog-road-to-strict-typing.md)

## Type Casting

`as` also functions as a cast:

```monkey
var view = View.findDrawableById("TimeLabel") as WatchUi.Text;
```

(source: blog-road-to-strict-typing.md)

## Nullable Types

Null acceptance is explicit:

```monkey
var optional as String or Null;
var nullable as String?;  // shorthand
```

(source: blog-road-to-strict-typing.md)

## Poly Types

Multiple allowed types use `or`:

```monkey
var value as Number or String;
```

(source: blog-road-to-strict-typing.md)

## Typed Containers

```monkey
var names = [] as Array<String>;
var scores = {} as Dictionary<String, Number>;
```

(source: blog-road-to-strict-typing.md)

## Structural Interfaces

```monkey
function process(handler as interface { function execute(); })
```

(source: blog-road-to-strict-typing.md)

## Typed Callbacks

```monkey
var callback as Method(data as String) as Void;
```

(source: blog-road-to-strict-typing.md)

## Enumerations

```monkey
enum Status { ACTIVE, INACTIVE }
```

(source: blog-road-to-strict-typing.md)

## If-Splits (Type Narrowing)

The compiler narrows types within conditional blocks:

```monkey
var heartRate = Activity.getActivityInfo().currentHeartRate;
if (heartRate != null) {
    drawHeartRate(dc, heartRate);  // heartRate is Number here
}
```

(source: blog-road-to-strict-typing.md)

## Import vs. Using

`import` brings class definitions into the namespace without requiring module
prefixes. Unlike `using`, it does not allow renaming:

```monkey
import Toybox.WatchUi;
// var x as Text;  — no WatchUi. prefix needed
```

(source: blog-road-to-strict-typing.md)

See also: [[monkey-c]], [[connect-iq-platform]]
