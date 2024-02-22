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

## Escaping whitespaces in SCP

In order to copy folders with whitespaces in their names from my seedbox (Ubuntu) to my Laptop (Windows), I use this command:

```powershell
scp -r "me@myseedbox:'/home/me/downloads/qbittorrent/Eli, Eli, Lema Sabachthani (2005)'" C:\Users\Me\Videos\
```

There's several ways to escape whitespaces in Powershell and Linux shell of course, but this one is the only that worked for me when trying to copy from a Linux server to a Windows computer.

## `sudo` on Windows

Running commands as admin in the same terminal window on Windows is not as straight-forward as in the Linux/Unix OS family. There's [a tool called `gsudo`](https://community.chocolatey.org/packages/gsudo) which can be installed via chocolatey. In 2024 ›sudo for Windows‹ [was introduced](https://devblogs.microsoft.com/commandline/introducing-sudo-for-windows/).

## Display Wi-Fi passwords

In order to display the Wi-Fi passwords you have saved on your computer, you first have to list all the saved connections with `netsh wlan show profiles` and look for the name of the connection you want the password of. Then type `netsh wlan show profile name="{NETWORK_NAME}" key=clear` and it will display the password under `Key Content`.
