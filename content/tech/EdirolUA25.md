---
title: "Using an Edirol UA-25 audio interface on Windows 11"
date: "2022-12-30"
---

Since the Edirol UA-25 is no class compliant device, it's not plug & play and needs a dedicated driver in order to run. The official driver is only supported up to Windows 8, but there's a little trick on how to still get it to run on Windows 11.

## Running it on Windows 11

* Download the latest official driver from Roland for the UA-25. It should be `ua25_w81d_v101`.
* In the zip, find the files `RDIF1046.INF` in `ua25_w81d_v101\Files\64bit\Files` or `ua25_w81d_v101\Files\32bit\Files`
* Replace the following line:
```
[Roland.NTamd64.7]
;; not supported
```

with:
```
[Roland.NTamd64.7]
;; Windows11
%RDID0046DeviceDesc%=RDID0046Install, USBVID_0582&PID_0074 ; UA-25
```

* Windows will detect that the driver was modified and prevent it from being installed, because it seems corrupted. Thus, you need to disable driver signature enforcement from Powershell like so:

```powershell
bcdedit /set testsigning off
```

* In case you get a "protected by Secure Boot policy" notification, enter advanced startup on Windows 11 by holding down SHIFT while clicking "Restart".
* Click "Choose an Option">"Troubleshoot">"Advanced Options">"Startup Settings">"Restart">"disable driver signature Enforcement"

* You can now install the modified driver via the Windows device manager.

* When everything is installed and works, make sure to turn driver signature enforcement on again for security reasons:
```powershell
bcdedit /set testsigning on
```
