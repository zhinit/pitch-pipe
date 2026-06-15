# Forum: How to Execute Unit Tests

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/3802/how-to-execute-unit-tests

## Original Problem

User nairolf123 attempted to execute unit tests for a Connect IQ widget but
encountered issues on macOS. The test class structure appeared correct, but no
test output was generated after running `monkeydo`.

## Test Code Example

```monkey
class TestHowToTest {
    (:test)
    static function testHowToTest(logger) {
        Test.assertEqual(1,1);
        return true;
    }
}
```

## Compilation Command

```bash
monkeyc -t -o bin/TestUnitTest.prg -w -y key \
  -z resources/drawables/drawables.xml:resources/layouts/layout.xml:resources/strings/strings.xml \
  -m manifest.xml source/TestHowToTest.mc source/TestUnitTestView.mc \
  source/TestUnitTestApp.mc -d fr735xt_sim
```

## Test Execution Command

```bash
monkeydo bin/TestUnitTest.prg /t
```

## Working Example from travis.vitek

The developer demonstrated successful test execution with multiple test
implementations:

```monkey
using Toybox.Test as Test;

class Class {
    (:test)
    static function test_static_class_method(logger) {
        logger.debug("abc");
        Test.assertEqual(1,1);
        return true;
    }
}

module Module {
    (:test)
    function test_module_method(logger) {
        logger.debug("abc");
        Test.assertEqual(1,1);
        return true;
    }
}

(:test)
function test_global_function(logger) {
    logger.debug("abc");
    Test.assertEqual(1,1);
    return true;
}
```

## Key Findings

**Platform Dependency**: Tests functioned on Windows but failed silently on
macOS, suggesting platform-specific tooling issues.

**Garmin Acknowledgment**: Brandon from Garmin confirmed awareness of the
macOS-specific problem and added it to their investigation list.

**Design Recommendations**: travis.vitek advised using duck typing rather than
formal interfaces, emphasizing encapsulation and controller-based dependency
injection for testable architecture.

## Known Issues

A compiler warning appeared: "Class 'RunNoEvil' does not initialize its super
class, 'Test'" — identified as a framework bug requiring no user action.
