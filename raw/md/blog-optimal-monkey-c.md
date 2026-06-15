# Optimal Monkey C: New Compiler Toolchain Overview

Source: https://forums.garmin.com/developer/connect-iq/b/news-announcements/posts/optimal-monkey-c

## Introduction

The Connect IQ team completed a comprehensive rewrite of the Monkey C build
tools, delivering a modernized toolchain with significant improvements in
performance and developer experience.

## Key Improvements

### Optimizing Code Generator

The new compiler includes an optimization pass that performs "constant folding,
constant substitution, branch elimination and a few other optimizations" before
executable generation. Developers can control optimization intensity using the
`-O` command line flag, configurable through Visual Studio Code workspace
settings. The optimization scale ranges from 0 (disabled) to 2 (release
mode), with level 2 providing maximum code space reduction.

### Typing by Default

Monkey Types, the gradual type system introduced in 2020, is now enabled by
default at the "gradual" level. This setting balances dynamic and static
typing by checking APIs without mandatory type annotations. Developers can
disable typing using project settings or the `-l 0` command line option.
Typing is independent from optimization features.

### Improved Code Analysis

The new compiler transforms source code into an intermediate representation
(IR) used throughout compilation phases. This architecture enables
sophisticated type checking and code generation while maintaining dynamic
language behavior, allowing the compiler to identify errors at compile time
rather than runtime.

### Import and Object Instantiation

Import behavior is now consistent between type and functional syntax:

```monkey
import B;

function usageExample() as ClassInB {
    return ClassInB();
}
```

Previously, functional syntax required explicit module prefixing.

### Enhanced Logging

Debug logging options support targeted troubleshooting:

| Option               | Argument  | Purpose                                  |
|----------------------|-----------|------------------------------------------|
| `--debug-log-level`  | 0–3       | Controls verbosity (errors to verbose)   |
| `--debug-log-output` | File path | Specifies log file location              |
| `--debug-log-device` | Device ID | Filters logs for specific devices        |

**Privacy Note:** Higher verbosity levels expose project details; limit to
level 1 for confidentiality.

## Availability

The beta version is accessible through the SDK manager under "Connect IQ
4.1.4.Compiler 2 Beta."
