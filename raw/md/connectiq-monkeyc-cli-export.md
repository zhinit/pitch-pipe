# Monkey C Command Line — Package Export

Source: monkeyc --help output from SDK 9.2.0
Fetched: 2026-06-17

## Build for a single device (.prg)

monkeyc -d <device> -f <monkey.jungle> -o <output.prg> -y <key.der> -w

## Build store package (.iq) for all manifest devices

monkeyc -e -f <monkey.jungle> -o <output.iq> -y <key.der> -w -r

The -e (--package-app) flag builds for ALL devices listed in the manifest
and packages them into a single .iq file for store upload.

The -r (--release) flag strips debug information.

## Key flags

-e, --package-app         Create an application package (.iq)
-d, --device <arg>        Target device (single-device build only)
-f, --jungles <arg>       Jungle files
-o, --output <arg>        Output file
-y, --private-key <arg>   Private key for signing
-w, --warn                Show compiler warnings
-r, --release             Strip debug information
-l, --typecheck <arg>     Type check level [0=off, 1=gradual, 2=info, 3=strict]
-O, --optimization <arg>  Optimization level [0-3, p=perf, z=size]
-t, --unit-test           Enable unit test compilation
-g, --debug               Print debug output
-k, --profile             Enable profiling support

## Notes

When packaging with -e, devices in the manifest that don't meet the
minSdkVersion are skipped with a warning. The build reports progress as
"N OUT OF M DEVICES BUILT" and ends with BUILD SUCCESSFUL.
