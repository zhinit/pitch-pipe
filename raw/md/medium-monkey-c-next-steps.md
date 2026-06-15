# Garmin Monkey C — Next Steps

Source: https://medium.com/@earel329/garmin-monkey-c-next-steps-a449651b77f5
Author: Eduardo Arellano
Date: February 24, 2020

## Arrays

Two creation methods: fixed-size and dynamic arrays.

```monkey
var array = new [size];
var array = [1, 2, 3, 15];
```

Two-dimensional arrays require pre-initialization:

```monkey
var twodimensions = [[x,y,z], [a,b,c]];
```

## Error Handling

Severe errors cannot be caught, including: Array Out Of Bounds, Null
Reference, Stack Overflow, and Out of Memory. Non-fatal cases use `try`,
`catch`, and `throw` similar to Java.

## Object-Oriented Concepts

- Inheritance uses `extends` keyword, allowing subclasses to modify inherited
  methods.
- Access modifiers (public, private, protected/hidden) function similarly to
  Java, with public as default.
- Classes and modules are always public at declaration level.

## Callbacks & Methods

Functions require `method()` and `invoke()` to pass between functions as
objects, distinguishing Monkey C from direct function passing.

## Memory Management

Monkey C uses reference counting rather than garbage collection, which is more
efficient for memory-limited wearables but vulnerable to circular references.

## Modules

Modules function as packages containing variables, classes, and functions, but
lack inheritance and hidden-protected modifiers.
