# Forum Thread: How do I run my app in the simulator?

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/258719/how-do-i-run-my-app-in-the-simulator
Fetched: 2026-06-14

## Original Post
**scottchapman_** (over 5 years ago)

User reports difficulty running their first Connect IQ app in the simulator. They've built an app for the Garmin 1030 using Visual Studio Code with the Monkey C extension and successfully created a `.prg` file. However, when launching the simulator, they only see a device image with a Garmin icon and cannot interact with it. They're asking for clarification on how the simulator works.

## Key Responses

**flowstate** provides initial guidance:
- Suggests using the "Monkey C: Run App" command
- Notes that a Garmin icon on screen may indicate an app crash
- Recommends checking the Output view in VS Code for log messages
- Explains device interaction: "You interact with the device by clicking on the device buttons in the simulator with the mouse"
- Suggests toggling between Terminal and Output views

**flowstate's diagnostic suggestions:**
- Try the "Monkey C: Verify Installation" command
- Close and restart the simulator
- Test with a different device
- Run sample projects from the SDK folder
- Create a new simple datafield project to test
- Check the SDK Manager to verify all devices are installed properly

**scottchapman_** confirms:
- Using SDK 3.2.5 on Windows 10
- Java version 1.8.0_281
- Verification command shows all SDK components verified and developer key set

**Final diagnosis:** The blue triangle displayed indicates the app crashed or exited, suggesting a potential issue with the app code rather than simulator configuration.
