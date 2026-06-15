# Garmin IQ and Monkey C Fundamentals

Source: https://medium.com/@earel329/garmin-iq-and-monkey-c-fundamentals-ffe83eebb3fc
Author: Eduardo Arellano

## Overview

Eduardo Arellano's Medium article introduces Monkey C, the programming
language for developing Garmin Connect IQ applications.

## Key Language Characteristics

**Object-Oriented Design**: Monkey C is an Object-Oriented language. There are
no primitive types like floats, integers or chars.

**Dynamic Typing**: The language employs "Duck typed" semantics, meaning
developers don't specify parameter or return types in functions. All functions
return values automatically.

**Language Influences**: The language draws from Java, JavaScript, Python, PHP,
and Ruby, making it accessible to experienced programmers.

## Development Capabilities

With Monkey C, developers can create:
- Watch faces
- Widgets displaying information
- Data fields for activity tracking calculations
- Full wearable applications and games

## Basic Syntax Elements

**Variable Declaration**: Uses `var` keyword for variables and `const` for
constants without type specification.

**Control Structures**: Supports standard if/else statements and switch cases
for conditional logic.

**Looping**: Includes do/while, while, and for loop implementations.

**Functions & Classes**: Uses `using` for imports, `function` for methods, and
`extends` for inheritance — differing from Java conventions.

## Development Environment

The setup requires Eclipse IDE with Garmin's plugin, which includes a
simulator for testing applications without purchasing multiple devices.
