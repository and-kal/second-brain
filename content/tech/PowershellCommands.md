---
title: "Useful Powershell commands"
date: "2023-08-16"
draft: true
---

## Powershell

### MD5 checksum
`certutil -hashfile <a_file> MD5` 
\
-> get the MD5 checksum of a_file

### Deleting MS Edge

`get-appxpackage *edge*`

...then copy the `PackageFullName` value and paste it as argument to `remove-appxpackage`:

`remove-appxpackage Microsoft.MicrosoftEdge.Stable_115.0.1901.203_neutral__8wekyb3d8bbwe`

Gotta do this regularly. (►__◄)