# Forum: Any Way to Remove Logging Statements from Release Builds

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/264215/any-way-to-remove-logging-statements-from-release-builds

## Original Post (1705490)

The developer asks about removing logging statements from release builds in
Connect IQ. Notes that Monkey C provides `(:release)` and `(:debug)`
annotations, and Monkey Jungle offers an `excludeAnnotations` mechanism.

**Key Issue:** Annotations only work on class or function level code blocks,
not on simple lexical blocks:

```monkey
(:debug) {
   log("this will not show in release build");
}
```

This syntax generates errors about missing semicolons.

**Secondary Issue:** Developer believed annotations don't stack:

```monkey
(:debug)
(:background)
function debug(string) {
  System.println(string);
}
```

## Response by flowstate

Annotations DO stack, but require combined syntax on a single line:

```monkey
(:debug :background)
function debug(string) {
  System.println(string);
}
```

Also mentions creating a custom conditional compilation system using the
C-preprocessor with annotations, enabling line-by-line `#ifdef` control.

## Response by jim_m_58

Uses manual commenting-out for debug statements, noting that actual removal
saves more space than using annotation-based wrappers that retain the string
literals.
