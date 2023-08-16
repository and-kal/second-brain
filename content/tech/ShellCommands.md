---
title: "Personal shell commands cheat sheet"
date: "2023-04-04"
draft: true
---

# Unix shell commands

Writing some down, because I'm bad at memorizing them all.

`cat`
\
-> 

`cp` / `copy`
\
-> copy a file (copy-paste)

`ls`
\
-> list files and folders

`cd`
\
-> change directory

`export`
\
-> 

`df`
\
-> show free disk memory

`dirs`
\
-> 

`du`
\
-> disk usage

`echo`
\
-> print strings or variables (just like `printf` or `stdout` in C)

`env`
\
-> print all current environment variables

`fuser`
\
-> 

`kill`
\
-> 

`ln`
\
-> create a link ("softlink"/"symlink")

`mkdir`
\
-> create directory

`mv`
\
-> move a file (cut-paste)

`alias`
\
-> show all aliases (stored in `~/.bashrc`); new aliases can be defined like so: `alias name='action'`

`popd`
\
-> 

`pushd`
\
-> 

`pwd`
\
-> prints path of the current working directory

`rm`
\
-> remove a file

`rmdir`
\
-> remove a folder

`time`
\
-> 

`umask`
\
-> show access rights in current folder (in umask octal format); use -S to see a verbal non-octal description in the form of `u=rwx,g=rwx,o=rwx` where `u` is the current user, `g` the group and `o` all others and `rwx` would be `read, write, execute`; note that umask octals are not the same as the octals of `chmod`  


`agrep`
\
-> 

`diff`
\
-> 

`egrep`
\
-> 

`fgrep`
\
-> 

`glimpse`
\
-> 

`grep`
\
-> 

`info`
\
-> 

`jobs`
\
-> 

`locate`
\
-> 

`man`
\
-> 

`occur`
\
-> 

`su`
\
-> 

`sudo`
\
-> ›superuser do‹

`whoami`
\
->

### Useful tools and combinations

#### Mounting and unmounting

`lstblk`
\
-> This will list all block devices and their partitions (you can also use `blkid` alternatively). After you have identified, for example, the HDD you just connected, you can mount it to a specific target with:  

`mount /dev/sda1 /media/myExternalHarddrive`

Unmounting it is done via `umount /dev/sda1`

<!-- 
`rsync`

`awk` 
-->

#### Finding a running process

`ps -ef | grep processname`
\
-> pipe ps into grep, i.e. list the currently running processes, send the list to `grep` which searches for lines containing the pattern `processname` (as regular expression)

#### Check size of folders 

To check the size of the folders in the current folder (and excluding subfolders), run: 

`du -sh --max-depth=1 ./*/`
\
(`-s` stands for summarize and `-h` for human-readable)