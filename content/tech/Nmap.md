---
title: "Some Nmap basics"
date: "2023-05-31"
draft: true
---

Nmap is a tool that lets you can scan your network devices and servers as if you were on the outside.


### Scanning all ports in your network


```powershell
nmap -sV -p 1-65535 192.168.1.1/24
```

`sV` is used in order to determine service/version info.
With `-p` you can specify a port or port range. 

You can also expand it, like so:

```powershell
nmap -sV -p 1-65535 -T4 -A -v 192.168.1.1/24
```

Here, `T4` stands for timing template number 4. You can also control the timing of `nmap` with low-level timing controls, but `nmap` comes with these six timing templates: `paranoid (0)`, `sneaky (1)`, `polite (2)`, `normal (3)`, `aggressive (4)`, and `insane (5)`

Accoring to the `nmap` manual, `-A` enables OS detection, version detection, script scanning, and traceroute.

`-v` sets the verbosity level to 1. For higher verbosity (i.e. more information about the scan being printed), you can type `-vv`, `-vvv`, or `-v3`.


## Nmap Scripting Engine (NSE)

The Nmap Scripting Engine (NSE) allows you to write scripts in [Lua](./Lua) and automate things, do bulk stuff etc.
https://hackertarget.com/7-nmap-nse-scripts-recon/