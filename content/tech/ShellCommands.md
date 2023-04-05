---
title: "Personal Shell Commands Cheat Sheet"
date: "2023-04-04"
draft: false
---


`cat` -> 

`cp` -> copy a file (copy-paste)

`ls` -> list files and folders

`cd` -> change directory

`export` -> 

`df` -> show free disk memory

`dirs` -> 

`du` -> disk usage

`echo` -> print strings or variables (just like `printf` or `stdout` in C)

`env` -> print all current environment variables

`kill` -> 

`ln` -> create a link ("softlink"/"symlink")

`mkdir` -> create directory

`mv` -> move a file (cut-paste)

`alias` -> show all aliases (stored in `~/.bashrc`); new aliases can be defined like so: `alias name='action'`

`popd` -> 

`pushd` -> 

`pwd` -> prints path of the current working directory

`rm` -> remove a file

`rmdir` -> remove a folder

`time` -> 

`umask` -> show access rights in current folder (in umask octal format); use -S to see a verbal non-octal description in the form of `u=rwx,g=rwx,o=rwx` where `u` is the current user, `g` the group and `o` all others and `rwx` would be `read, write, execute`; note that umask octals are not the same as the octals of `chmod`  


`agrep` -> 

`diff` -> 

`egrep` -> 

`fgrep` -> 

`glimpse` -> 

`grep` -> 

`info` -> 

`jobs` -> 

`locate` -> 

`man` -> 

`occur` -> 

`su` -> 

`sudo` -> 

`whoami` ->

## Some useful combinations

`ps -ef | grep processname` -> pipe ps into grep, i.e. list the currently running processes, send the list to `grep` which searches for lines containing the pattern `processname` (as regular expression)