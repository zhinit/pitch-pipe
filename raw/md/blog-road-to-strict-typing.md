# The Road to Strict Typing Is Paved with Good Intentions

Source: https://forums.garmin.com/developer/connect-iq/b/news-announcements/posts/the-road-to-strict-typing-is-paved-with-good-intentions

## Overview

Garmin's Connect IQ 4 introduces Monkey Types, a new type system for the
Monkey C language that provides compile-time type checking. "Monkey Types has
four levels of type-check, from none to strict, to allow developers to choose
their style of programming."

## Four Type-Checking Levels

| Level           | Characteristics                                              |
|-----------------|--------------------------------------------------------------|
| **None**        | Default behavior; no type checking required                  |
| **Gradual**     | Checks typed code interactions; minimal refactoring needed   |
| **Informative** | Issues warnings about untyped code while checking typed      |
| **Strict**      | Requires all definitions to be explicitly typed              |

## Core Type Annotations

### Basic Syntax

```monkey
var timeLabel as WatchUi.Text?;
function drawHeartRate(dc as Dc, heartRate as Number) as Void { }
```

Member variables, parameters, and return values use the `as` keyword for type
declaration.

## Type Casting

The `as` keyword also functions as a casting operator:

```monkey
var view = View.findDrawableById("TimeLabel") as WatchUi.Text;
```

## Typed Containers

Containers support explicit typing:

```monkey
var stringArray = [] as Lang.Array<Lang.String>;
var typedDict = {} as Lang.Dictionary<Lang.String, Lang.String>;
```

## Import vs. Using Statements

The `import` statement brings class definitions into the namespace:

```monkey
import Toybox.WatchUi;
// Now: var x as Text; (instead of WatchUi.Text;)
```

Unlike `using`, `import` prohibits module renaming to maintain code
readability.

## Advanced Type Features

### Poly Types

Multiple allowed types using `or` syntax:

```monkey
var value as Number or String;
```

### Interfaces

Structural typing for custom requirements:

```monkey
function process(handler as interface { function execute(); })
```

### Enumerations

Named enum definitions for type-safe constants:

```monkey
enum Status { ACTIVE, INACTIVE }
```

### Callbacks

Typed Method objects:

```monkey
var callback as Method(data as String) as Void;
```

### Null Handling

Explicit null acceptance:

```monkey
var optional as String or Null;
var nullable as String?;  // shorthand
```

## Defensive Coding Patterns

Type checking encourages null-safe patterns through if-splits, where the
compiler narrows types within conditional blocks:

```monkey
var heartRate = Activity.getActivityInfo().currentHeartRate;
if (heartRate != null) {
    drawHeartRate(dc, heartRate);
}
```

## Runtime Implications

"Monkey Types only exist at compile and do not add any runtime baggage to your
app."

## Selection Guidance

Strict typing makes greatest sense for new codebases, while existing stable
projects may benefit from gradual checking without full refactoring.
