---
title: "Edirol UA-25 Audio Interface"
---

### Running it on Windows 11

* Find the files `...` and `...` in `...`
* Replace the following line:

with

* disable driver signature enforcement from PS:

```powershell
bcdedit /set testsigning off
```

(don't forget to turn it on again later for security)

```powershell
bcdedit /set testsigning on
```

* in case there's a "protected by Secure Boot policy" notification, enter advanced startup on Windows 11 by holding down SHIFT while clicking "Restart"
* click: "Choose an Option">"Troubleshoot">"Advanced Options">"Startup Settings">"Restart">"disable driver signature Enforcement"

You can now install the driver via the Windows device manager.