---
title: "Useful Windows tools for debloating and stuff"
date: "2023-10-12"
draft: false
---

## Debloaters

- [Win-Debloat-Tools](https://github.com/LeDragoX/Win-Debloat-Tools)
- [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater)

## Removing Widgets

If you don't care about seeing the weather and temperature in your taskbar, you can hide Widgets under ›Taskbar settings‹. And in case you completely want to remove Widgets, run `Get-AppxPackage *WebExperience* | Remove-AppxPackage`.

## Activation script

😈

```powershell
irm https://massgrave.dev/get | iex
```

## Utilities

- [Chris Titus Tech's Windows Utility](https://github.com/ChrisTitusTech/winutil) :: several utilities for (un-)installing software, (de-)activating Windows functionalities, debloating etc.
- [PowerToys](https://github.com/microsoft/PowerToys) :: »system utilities to maximize productivity«
- [Sysinternals](https://learn.microsoft.com/de-de/sysinternals) :: »technical resources and utilities to manage, diagnose, troubleshoot, and monitor a Microsoft Windows environment«
