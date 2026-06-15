# Toybox.Test Module API Documentation

Source: https://developer.garmin.com/connect-iq/api-docs/Toybox/Test.html

## Overview

The Test module provides a unit testing framework for Monkey C, enabling
developers to implement unit tests and assertions in source code.

## Key Features

- **Test Functions**: Annotated with `:test` and accept a Logger object
- **Assertions**: Don't require annotations; compiled out in release versions
- **Logging Levels**: Support debug, error, and other output levels
- **Test Results**: Console output displays test status and failure metrics

## Available Methods

### assert()

**Signature**: `assert(test as Lang.Boolean) as Void`

Throws an exception when the test evaluates to false.

**Parameters**:
- `test` — Boolean expression to validate

**Throws**: Test.AssertException

### assertEqual()

**Signature**: `assertEqual(value1 as Lang.Object, value2 as Lang.Object or Null) as Void`

Throws an exception when value1 and value2 are not equal. Objects must
implement `Object.equals()`.

**Parameters**:
- `value1` — First value for comparison
- `value2` — Second value for comparison

**Throws**: Test.AssertException

### assertEqualMessage()

**Signature**: `assertEqualMessage(value1 as Lang.Object, value2 as Lang.Object or Null, message as Lang.String) as Void`

Throws an exception when values aren't equal, followed by a developer-defined
message.

**Parameters**:
- `value1` — First value for comparison
- `value2` — Second value for comparison
- `message` — Custom failure message

**Throws**: Test.AssertException

### assertMessage()

**Signature**: `assertMessage(test as Lang.Boolean, message as Lang.String) as Void`

Throws an exception when test is false, appended with a custom message.

**Parameters**:
- `test` — Boolean expression to validate
- `message` — Custom failure message

**Throws**: Test.AssertException

### assertNotEqual()

**Signature**: `assertNotEqual(value1 as Lang.Object, value2 as Lang.Object or Null) as Void`

Throws an exception when value1 and value2 are equal.

**Parameters**:
- `value1` — First value for comparison
- `value2` — Second value for comparison

**Throws**: Test.AssertException

### assertNotEqualMessage()

**Signature**: `assertNotEqualMessage(value1 as Lang.Object, value2 as Lang.Object or Null, message as Lang.String) as Void`

Throws an exception when values are equal, followed by a developer-defined
message.

**Parameters**:
- `value1` — First value for comparison
- `value2` — Second value for comparison
- `message` — Custom failure message

**Throws**: Test.AssertException

## Related Classes

- **AssertException**: Exception thrown by assertion failures
- **Logger**: Object passed to test functions for output management

## API Level

Available since API Level 2.1.0
