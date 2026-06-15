# Monkey C and Monkey Do: A Reflection About Weak References

Source: https://pauguillamon.com/2016/04/26/monkey-c-and-monkey-do-a-reflection-about-weak-references/
Author: Pau Guillamon

## Overview

Examines weak references in Monkey C, the programming language for Garmin's
Connect IQ platform. Explores both the benefits and drawbacks of this memory
management approach.

## Reference Counting Background

Monkey C uses reference counting rather than garbage collection for memory
management. This allows rapid memory deallocation in low-memory environments,
but has a critical weakness: circular references cannot be automatically freed.

## The Solution: Weak References

Starting with version 1.2.x, Monkey C introduced weak references to address
circular reference problems. These references "keep a reference to an object
but do not increment the reference count," allowing objects to be freed when
only weak references remain.

## Practical Problems

The simulator can detect circular references but doesn't automatically resolve
them. The simulator sometimes crashes from circular references and displays
memory warnings, forcing developers to manually implement weak reference
solutions.

## Critical Reflection

The author argues this feature represents an architectural shortcoming rather
than an elegant solution. Developers must consciously consider memory
management — contradicting the goal of abstracting such concerns. He questions
whether this burden shifts responsibility inappropriately to programmers who
shouldn't need to think about these implementation details.
