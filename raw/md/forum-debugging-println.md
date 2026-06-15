# Forum: Debugging with println / console

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/265167/debugging-with-println-console

## Original Question

A developer asked why `System.println("hello world");` statements weren't
producing output in the console when debugging a Connect IQ app in the
`onUpdate()` function, despite properly importing `Toybox.System`.

## Code Example

```monkey
function onUpdate(dc as Dc) as Void {
    View.onUpdate(dc);
    System.println("hello world");
}
```

## Troubleshooting (jim_m_58)

Asked which tool the developer was using (Eclipse, VS Code, or command line).
The user confirmed Eclipse IDE for Java Developers (version 2021-03).

Suggested checking for "firewall or ad blocker SW running" that might
interfere with console output capture.

## Resolution

Thread remained unresolved (marked "Not Answered"). The troubleshooting path
indicated environmental or IDE configuration issues rather than code problems.
