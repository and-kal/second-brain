---
title: "Useful Powershell commands"
date: "2023-08-16"
draft: true
---

## MD5 checksum

`certutil -hashfile <filename> MD5`
\
-> get the MD5 checksum of a_file

## Deleting MS Edge

`get-appxpackage *edge*`

...then copy the `PackageFullName` value and paste it as argument to `remove-appxpackage`:

`remove-appxpackage Microsoft.MicrosoftEdge.Stable_115.0.1901.203_neutral__8wekyb3d8bbwe`

On Windows updates Edge will usually be reinstalled, so you gotta do this regularly. (►\_\_◄) Or you can use some [tools to debloat Windows](./DebloatingWindows).

## Get detailed network configurations

In order to display IP address, subnet masks, default gateways and DNS server configs of your current network, just execute `ipconfig /all` or `Get-NetIPAddress`.

## Mounting an .iso file

In order to create a virtual drive and mount an .iso image, use the following command:

```powershell
Mount-DiskImage -ImagePath "C:\whatever.iso"
```

(For more information check the [Windows Powershell docs](https://github.com/MicrosoftDocs/windows-powershell-docs/blob/main/docset/winserver2022-ps/storage/Mount-DiskImage.md).)
