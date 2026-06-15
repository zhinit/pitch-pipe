# Unit Testing

Connect IQ includes a unit testing framework called "Run No Evil," available
since API Level 2.1.0. (source: connectiq-toybox-test-api.md)

## Writing Tests

Test functions are annotated with `(:test)`, receive a `Logger` parameter, and
return a `Boolean`. (source: connectiq-toybox-test-api.md)

```monkey
import Toybox.Test;

(:test) function testAddition(logger as Logger) as Boolean {
    logger.debug("testing addition");
    Test.assertEqual(1 + 1, 2);
    return true;
}
```

Tests can be global functions, static class methods, or module functions:

```monkey
class MyTests {
    (:test)
    static function testInClass(logger) {
        Test.assertEqual(1, 1);
        return true;
    }
}

module MyModule {
    (:test)
    function testInModule(logger) {
        Test.assertEqual(1, 1);
        return true;
    }
}
```

(source: forum-how-to-execute-unit-tests.md)

One forum thread reports that defining tests inside a class (non-static) does
not work — the framework expects the patterns above.
(source: forum-unit-test-example.md)

## Logger

The `Logger` parameter provides output methods for test diagnostics:

- `logger.debug(message)` — debug-level output
- `logger.warning(message)` — warning-level output
- `logger.error(message)` — error-level output

(source: forum-unit-test-example.md)

## Assertions

The `Toybox.Test` module provides these assertion methods
(source: connectiq-toybox-test-api.md):

| Method                  | Behavior                                         |
|-------------------------|--------------------------------------------------|
| `assert(test)`          | Throws if `test` is false                        |
| `assertMessage(test, msg)` | Throws if `test` is false, with custom message |
| `assertEqual(a, b)`    | Throws if `a` and `b` are not equal              |
| `assertEqualMessage(a, b, msg)` | Throws if not equal, with custom message |
| `assertNotEqual(a, b)` | Throws if `a` and `b` are equal                  |
| `assertNotEqualMessage(a, b, msg)` | Throws if equal, with custom message |

`assertEqual` uses `Object.equals()` for comparison.

Assertions do not require the `(:test)` annotation and are compiled out in
release builds. (source: connectiq-toybox-test-api.md)

## Building and Running Tests

### VS Code

Use Command Palette → **Monkey C: Run Tests** (if available), or build
manually with the `--unit-test` flag.

### CLI

Build with the `--unit-test` flag:

```bash
monkeyc --unit-test -o bin/tests.prg -f monkey.jungle \
  -y developer_key.der -d fr245m
```

Run with `/t`:

```bash
monkeydo bin/tests.prg /t
```

(source: forum-how-to-execute-unit-tests.md)

A more complete invocation from a forum example:

```bash
java -Xms1g -Dfile.encoding=UTF-8 -jar [SDK]/monkeybrains.jar \
  -o bin/test.prg -f monkey.jungle -y developer_key.der \
  -d [device] -w -l 3 -O2z --unit-test
```

(source: forum-unit-test-example.md)

## Mocking

There is no built-in mocking framework. Garmin's own LogMonkey barrel tests
demonstrate a manual mock pattern — defining a `MockSys` class that captures
`println` output into a string for assertion:

```monkey
class MockSys {
    private var mStreamContents;
    function initialize() { mStreamContents = ""; }
    function println(message) {
        mStreamContents = mStreamContents + message + "\n";
    }
    function getStreamContents() { return mStreamContents; }
}
```

(source: github-logmonkey-tests.md)

## Limitations

- No built-in parameterized / data-provider tests.
  (source: forum-unit-test-example.md)
- Historical macOS issues where tests compiled but produced no output; Garmin
  acknowledged and investigated. (source: forum-how-to-execute-unit-tests.md)
- Tests run in the simulator, not on device hardware.

## Test Annotations and Build Exclusion

The `(:test)` annotation causes the function to be ignored unless the test
build flag is active. See [[monkey-c]] for the annotation and
`excludeAnnotations` system. (source: forum-remove-logging-release.md)

See also: [[debugging]], [[monkey-c]], [[simulator]]
