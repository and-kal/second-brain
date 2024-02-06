---
title: "Useful Powershell commands"
date: "2023-08-16"
draft: false
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

## Creating an empty file

```powershell
echo $null >> config.ini
```

## Setting a environment variable

```powershell
$Env:AWS_DEFAULT_REGION="eu-central-1"
```

## Using `.nvmrc` files

If you have `nvm` installed, in shells such as `zsh` or `bash` you can just run `nvm use` in order to switch to the node version specified in your `.nvmrc` file. With `nvm-windows` it's a little trickier. You will have to run the following command everytime before starting up your project in order to use the correct node version:

```powershell
nvm use $(Get-Content .nvmrc)
```

But chances are that you will forget it sometime and use a wrong node version and wonder why your application doesn't work. Here is [a smart gist](https://gist.github.com/tcrammond/e52dfad4c2b36258f83f7a964af10097) with an alias for a script that works like `nvm use`. For more information, here is [the relevant Github issue](https://github.com/coreybutler/nvm-windows/issues/128), which contains some more strategies to use `nvm use` on Windows and also an explanation why it will not be implemented as a native feature in `nvm-windows`.

Note that, if you want to use `nvm-windows`, it is advisable to uninstall your current node.js installation and reinstall this one with `nvm` as well. Otherwise, Powershell might still use the version of `node` your environment variable points to instead of the one targeted with `nvm use`.
