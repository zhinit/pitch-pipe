# Monkey C

Monkey C is Garmin's programming language for [[connect-iq-platform]] apps. It
draws from Java, JavaScript, Python, PHP, and Ruby.
(source: medium-monkey-c-fundamentals.md)

## Language Characteristics

Object-oriented, duck-typed (dynamically typed by default), with an optional
gradual type system called [[monkey-types]].
(source: medium-monkey-c-fundamentals.md, blog-road-to-strict-typing.md)

The programmer's guide lists these features
(source: connectiq-programmers-guide-toc.md):

- Functions, variables, expressions, operators
- Arrays, dictionaries, symbols, constants, enumerations
- Control flow: if/switch, loops (for, while, do/while)
- Error handling and exceptions
- Classes, objects, constructors, inheritance
- Modules and using/import statements

## Numeric Types

| Type     | Size            |
|----------|-----------------|
| Number   | Signed 32-bit   |
| Float    | Signed 32-bit   |
| Long     | Signed 64-bit   |
| Double   | Signed 64-bit   |

There are no primitive types in the Java sense — all values are objects.
(source: forum-monkey-c-grammar.md, medium-monkey-c-fundamentals.md)

## Variables and Constants

```monkey
var name = "pitch pipe";
const CONCERT_A = 440;
```

(source: medium-monkey-c-fundamentals.md)

## Self Reference

Both `self` and `me` refer to the current object (`this` in Java/JS). `me` is
a legacy holdover. (source: forum-monkey-c-grammar.md)

## Classes and Inheritance

```monkey
class PitchPipeView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }
}
```

Classes use `extends` for inheritance. Access modifiers: `public` (default),
`private`, `hidden` (equivalent to protected). Classes and modules are always
public at the declaration level — modifiers only apply to members.
(source: medium-monkey-c-next-steps.md, forum-monkey-c-grammar.md)

## Modules

Modules function as packages containing variables, classes, and functions.
Unlike classes, modules cannot use inheritance or the hidden/protected
modifier. (source: medium-monkey-c-next-steps.md)

```monkey
module MyModule {
    var count = 0;
    function increment() { count++; }
}
```

## Static Members

Static variables in a class function as "scoped modules" — accessible to all
members of the class. The API generally uses module functions rather than
static class functions. (source: forum-monkey-c-grammar.md)

## Containers

Arrays can be fixed-size or dynamic:

```monkey
var fixed = new [10];
var dynamic = [1, 2, 3];
var matrix = [[1, 2], [3, 4]];
```

Dictionaries use `=>` syntax:

```monkey
var notes = { "A4" => 440, "B4" => 494 };
```

Typed containers are available via [[monkey-types]]:
`[] as Array<Number>`, `{} as Dictionary<String, Number>`.
(source: medium-monkey-c-next-steps.md, blog-road-to-strict-typing.md)

## Callbacks

Functions cannot be passed directly as values. Use `method()` to get a
reference and `invoke()` to call it:

```monkey
var cb = method(:onSelect);
cb.invoke();
```

(source: medium-monkey-c-next-steps.md)

## Error Handling

Non-fatal exceptions use `try`/`catch`/`throw` similar to Java. Fatal errors
(Array Out Of Bounds, Null Reference, Stack Overflow, Out of Memory) cannot be
caught. (source: medium-monkey-c-next-steps.md)

## Annotations

Annotations mark code for conditional compilation
(source: forum-remove-logging-release.md):

| Annotation     | Effect                                      |
|----------------|---------------------------------------------|
| `(:test)`      | Included only in test builds                |
| `(:debug)`     | Excluded from release builds                |
| `(:release)`   | Included only in release builds             |
| `(:background)`| Included in background service builds       |

Annotations apply at the function or class level only — not to arbitrary
blocks. Multiple annotations combine on one line: `(:debug :background)`.

The `excludeAnnotations` mechanism in `monkey.jungle` controls which
annotations are stripped from the build.

## Syntax Notes

- Ternary operator (`expr ? expr : expr`) exists but was historically
  undocumented. (source: forum-monkey-c-grammar.md)
- Bare expression statements (`a+2;`) are not allowed; statements require an
  assignment or method invocation. (source: forum-monkey-c-grammar.md)
- String formatting follows C99: `%02d` for leading zeros.
  (source: forum-new-developer-faq.md)

## Key API Namespace

All built-in APIs live under the `Toybox` namespace. Key modules include:

- `Toybox.Attention` — tones, vibration, backlight (see [[attention-api]])
- `Toybox.WatchUi` — views, input handling, menus
- `Toybox.Application` — app lifecycle, storage
- `Toybox.Graphics` — drawing context
- `Toybox.Media` — audio content provider support
- `Toybox.Test` — unit testing framework (see [[unit-testing]])

(source: connectiq-programmers-guide-toc.md, connectiq-toybox-test-api.md)

## Memory Management

Monkey C uses reference counting — not garbage collection. Objects start with
a reference count of 1; the count increments when new references are made and
decrements when references leave scope. An object is deallocated when its
count reaches zero. (source: forum-garbage-collection.md)

Circular references (A → B → A) prevent deallocation. The simulator detects
these at program exit. Weak references (available since v1.2.x) solve this:
they reference an object without incrementing its count.
(source: blog-weak-references-monkey-c.md, forum-garbage-collection.md)

Entry-level devices like the [[fr245m-device]] have only 128 KB of runtime
memory, so resource optimization matters.
(source: blog-real-devices-of-connectiq.md)

## Compiler

The current compiler rewrites source to an intermediate representation (IR)
for analysis. Key flags (source: blog-optimal-monkey-c.md):

- `-O 0|1|2` — optimization level (2 = release, maximum size reduction)
- `-l 0|1|2|3` — type-check level (see [[monkey-types]])
- `--unit-test` — enable test build (see [[unit-testing]])

See also: [[monkey-types]], [[unit-testing]], [[debugging]],
[[connect-iq-platform]], [[fr245m-device]]
