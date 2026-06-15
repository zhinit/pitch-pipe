# Garmin Connect IQ Simulator Feature Request Discussion

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/437771/feature-request-updated-simulator
Fetched: 2026-06-14

## Original Post by andrewM (5 days ago, relative to fetch date)

The developer requests several simulator improvements, noting that 3.5 of 4 development hours were spent testing on real devices because the simulator doesn't match actual hardware behavior.

**Key requests:**
1. Service/MCP for programmatic simulator interaction and automated UI testing with screenshots
2. Command-line options to pre-configure simulator parameters (FIT files, language, etc.)
3. Real device memory limitations visibility
4. Wireless debugging connection to actual Garmin devices
5. BLE requestBond() support in the simulator

## Notable Responses

**Sam Dumont** echoes the frustration: "If only ONE thing could be fixed, please fix the BLE requestBond()." He emphasizes that developing end-to-end BLE flows without simulator support requires "flying blind" with static test data.

**Jim_m_58** provides significant updates:
- SDK 9.2.0 now includes "bonded connection support in the simulator"
- Provides firmware links for nRF52 DK and nRF52840 Dongle for BLE development

**Tim** suggests using beta store versions instead of wireless device debugging, prompting andrewM to clarify that beta testing involves manual uploads, poor debugging visibility, and slow iteration cycles — fundamentally different from direct wireless debugging.

**Final exchange** shows ongoing concern about automated upload/reinstall processes remaining unaddressed.
