# GitHub: LogMonkey Test File

Source: https://github.com/garmin/connectiq-apps/blob/master/barrels/LogMonkey/LogTests.mc

This test file validates the LogMonkey logging barrel for Garmin Connect IQ
applications. Complete source code from Garmin's official connectiq-apps repo.

```monkey
using Toybox.Test as Test;
using Toybox.Lang as Lang;
using LogMonkey as Log;

module LogMonkey {

(:test)
module Test {

class MockSys {
  private var mStreamContents;

  function initialize() {
    mStreamContents = "";
  }

  function println(message) {
    mStreamContents = mStreamContents + message + "\n";
  }

  function getStreamContents() {
    return mStreamContents;
  }
}

class TestException extends Lang.Exception {
  function initialize() {
    Exception.initialize();
  }

  function getErrorMessage() {
    return "This is a test Exception";
  }
}

public function do_testLogVariable(level, tag, name, variable, match) {
  var mockSys = new MockSys();
  var log = new $.LogMonkey.Logger(level, mockSys);
  log.logVariable(tag, name, variable);
  log = null;
  var logOutput = mockSys.getStreamContents();
  Test.assertMessage(logOutput.find(match) != null,
    "Match not found: '" + match + "' not in '" + logOutput + "'");
}

(:test) function testLogVariable_null(logger) {
  do_testLogVariable("D", "test null", "null_value", null,
    "\] {D} test null: null_value=(null) null");
  return true;
}

(:test) function testLogVariable_Array(logger) {
  do_testLogVariable("D", "test array", "empty_array_value", [],
    "\] {D} test array: empty_array_value=(Array) []");
  do_testLogVariable("D", "test array", "array_value", [ 1, "abc" ],
    "\] {D} test array: array_value=(Array) [1, abc]");
  return true;
}

(:test) function testLogVariable_Boolean(logger) {
  do_testLogVariable("D", "test boolean", "true_value", true,
    "\] {D} test boolean: true_value=(Boolean) true");
  do_testLogVariable("D", "test boolean", "false_value", false,
    "\] {D} test boolean: false_value=(Boolean) false");
  return true;
}

(:test) function testLogVariable_Char(logger) {
  do_testLogVariable("D", "test char", "char_value", 'c',
    "\] {D} test char: char_value=(Char) c");
  return true;
}

(:test) function testLogVariable_Dictionary(logger) {
  do_testLogVariable("D", "test dictionary", "empty_dictionary_value", {},
    "\] {D} test dictionary: empty_dictionary_value=(Dictionary) {}");
  do_testLogVariable("D", "test dictionary", "dictionary_value", { 'a'=>4 },
    "\] {D} test dictionary: dictionary_value=(Dictionary) {a=>4}");
  return true;
}

(:test) function testLogVariable_Double(logger) {
  do_testLogVariable("D", "test double", "negative_value", -1d,
    "\] {D} test double: negative_value=(Double) -1");
  do_testLogVariable("D", "test double", "zero_value", 0d,
    "\] {D} test double: zero_value=(Double) 0");
  do_testLogVariable("D", "test double", "positive_value", 1d,
    "\] {D} test double: positive_value=(Double) 1");
  do_testLogVariable("D", "test double", "double_value", 3.1415d,
    "\] {D} test double: double_value=(Double) 3.1415");
  return true;
}

(:test) function testLogVariable_Exception(logger) {
  do_testLogVariable("D", "test exception", "exception_value",
    new Lang.Exception(),
    "\] {D} test exception: exception_value=(Exception) Obj: ");
  do_testLogVariable("D", "test exception", "exception_value",
    new TestException(),
    "\] {D} test exception: exception_value=(Exception) Obj: ");
  return true;
}

(:test) function testLogVariable_Float(logger) {
  do_testLogVariable("D", "test float", "negative_value", -1.0,
    "\] {D} test float: negative_value=(Float) -1.0");
  do_testLogVariable("D", "test float", "zero_value", 0f,
    "\] {D} test float: zero_value=(Float) 0");
  do_testLogVariable("D", "test float", "positive_value", 1.0,
    "\] {D} test float: positive_value=(Float) 1.0");
  do_testLogVariable("D", "test float", "float_value", 3.1415,
    "\] {D} test float: float_value=(Float) 3.1415");
  return true;
}

(:test) function testLogVariable_Long(logger) {
  do_testLogVariable("D", "test long", "negative_value", -1l,
    "\] {D} test long: negative_value=(Long) -1");
  do_testLogVariable("D", "test long", "zero_value", 0l,
    "\] {D} test long: zero_value=(Long) 0");
  do_testLogVariable("D", "test long", "positive_value", 1l,
    "\] {D} test long: positive_value=(Long) 1");
  do_testLogVariable("D", "test long", "long_value", 1337l,
    "\] {D} test long: long_value=(Long) 1337");
  do_testLogVariable("D", "test long", "min_long_value", -9223372036854775808l,
    "\] {D} test long: min_long_value=(Long) -9223372036854775808");
  do_testLogVariable("D", "test long", "max_long_value", 9223372036854775807l,
    "\] {D} test long: max_long_value=(Long) 9223372036854775807");
  return true;
}

(:test) function testLogVariable_Method(logger) {
  do_testLogVariable("D", "test method", "method_value",
    new Lang.Method(Toybox.System, :println),
    "\] {D} test method: method_value=(Method) Obj: ");
  return true;
}

(:test) function testLogVariable_Number(logger) {
  do_testLogVariable("D", "test number", "negative_value", -1,
    "\] {D} test number: negative_value=(Number) -1");
  do_testLogVariable("D", "test number", "zero_value", 0,
    "\] {D} test number: zero_value=(Number) 0");
  do_testLogVariable("D", "test number", "positive_value", 1,
    "\] {D} test number: positive_value=(Number) 1");
  do_testLogVariable("D", "test number", "number_value", 1337,
    "\] {D} test number: number_value=(Number) 1337");
  do_testLogVariable("D", "test number", "min_number_value", -2147483648,
    "\] {D} test number: min_number_value=(Number) -2147483648");
  do_testLogVariable("D", "test number", "max_number_value", 2147483647,
    "\] {D} test number: max_number_value=(Number) 2147483647");
  return true;
}

(:test) function testLogVariable_String(logger) {
  do_testLogVariable("D", "test string", "empty_string_value", "",
    "\] {D} test string: empty_string_value=(String)");
  do_testLogVariable("D", "test string", "string_value", "a string",
    "\] {D} test string: string_value=(String) a string");
  return true;
}

(:test) function testLogVariable_Symbol(logger) {
  do_testLogVariable("D", "test symbol", "symbol_value", :thisIsASymbol,
    "\] {D} test symbol: symbol_value=(Symbol) thisIsASymbol");
  return true;
}

(:test) function testLogVariable_WeakReference(logger) {
  var testObject = new Lang.Object();
  var varToTest = testObject.weak();
  do_testLogVariable("D", "test weak reference", "weak_reference_value",
    varToTest,
    "\] {D} test weak reference: weak_reference_value=(WeakReference)");
  return true;
}

(:test) function testLogVariable_Object(logger) {
  do_testLogVariable("D", "test object", "object_value", new Lang.Object(),
    "\] {D} test object: object_value=(Object) Obj: ");
  return true;
}

(:test) function testLogVariable_NonLangObject(logger) {
  do_testLogVariable("D", "test non lang object", "non_lang_object_value",
    Toybox.System.getClockTime(),
    "\] {D} test non lang object: non_lang_object_value=(Object) Obj: ");
  return true;
}

(:test) function testLogPrefix(logger) {
  var mockSys = new MockSys();
  var log = new $.LogMonkey.Logger("I", mockSys);
  log.logVariable("i", "iI", logger);
  log = null;
  var logOutput = mockSys.getStreamContents();
  var prefix = "(lmf1)[";
  Test.assertMessage(logOutput.find(prefix) == 0,
    "Prefix '" + prefix + "' not found in '" + logOutput + "'");
  return true;
}

(:test) function testLogOutput(logger) {
  var aMessage = "Captain's log, Stardate 31415.9 We have discovered a delicious pie.";
  var anException = new TestException();
  var aString = "this is a string";

  logger.debug("Initializing log variables...");
  var logLevel = "D";
  var mockSys = new MockSys();
  var log = new $.LogMonkey.Logger(logLevel, mockSys);

  logger.debug("Making test log calls...");
  log.logMessage("log verification", aMessage);
  log.logException("log verification", anException);
  log.logVariable("log verification", "aString", aString);

  var logContents = mockSys.getStreamContents();
  logger.debug("Log contents:\n" + logContents);
  logger.debug("Verifying log output...");

  logger.debug(" ...logMessage()...");
  Test.assert(logContents.find("(lmf1)[") != null);
  Test.assert(logContents.find(
    "] {D} log verification: Captain's log, Stardate 31415.9 We have discovered a delicious pie."
  ) != null);

  logger.debug(" ...logException()...");
  Test.assert(logContents.find("(lmf1)[") != null);
  Test.assert(logContents.find(
    "] {D} log verification: This is a test Exception"
  ) != null);

  logger.debug(" ...logVariable()...");
  Test.assert(logContents.find("(lmf1)[") != null);
  Test.assert(logContents.find(
    "] {D} log verification: aString=(String) this is a string"
  ) != null);

  return true;
}

}
}
```
