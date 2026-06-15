# Forum: Unit Test Example & How to Run It

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/319988/unit-test-example-how-to-run-it

## Problem Statement

A developer struggled with unit testing in Garmin Connect IQ, encountering a
compilation error: "Cannot find symbol ':error' on type
'$.Toybox.Test.Logger'" when attempting to run tests on a test class.

## Key Solution

The primary issue was structural: the developer attempted to create a test
class, but the framework requires global test functions instead.

### Correct Approach

Tests should be defined as global functions with the `(:test)` annotation:

```monkey
import Toybox.Test;

(:test) function testFoo(logger as Logger) {
    logger.warning("warning");
    logger.debug("debug");
    logger.error("error");
    return 42 == 42;
}
```

### Running Tests via CLI

```bash
java -Xms1g -Dfile.encoding=UTF-8 -jar [SDK]/monkeybrains.jar \
  -o bin/test_device.prg -f monkey.jungle;barrels.jungle \
  -y developer_key.der -d [device] -w -l 3 -O2z --unit-test
```

## Additional Resources

One respondent referenced a comprehensive tutorial at starttorun.info
covering unit test setup, noting that "concepts still stand in vs code"
despite being Eclipse-focused.

## Limitations Identified

The framework lacks built-in data provider functionality comparable to other
testing frameworks — developers cannot parameterize tests to run multiple
scenarios automatically.
