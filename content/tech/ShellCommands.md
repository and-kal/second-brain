---
title: "Personal shell commands cheat sheet"
date: "2023-04-04"
draft: true
---

# Unix shell commands

Writing some down, because I'm bad at memorizing them all.
A lot of those are standard Linux commands or so-called ›shell builtin‹.

`cat`
\
-> stands for ›concatenate‹ and prints the output of the file

`cp` / `copy`
\
-> copy a file (copy-paste)

`ls`
\
-> list files and folders

`less`
\
-> display only as much of a file's content as fits the screen

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

`head` and `tail`
\
-> print the first lines of a file or the last lines of a file respectively, where you can specify the number of lines with `-n` (so `head -4` prints the first four lines)

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

`sort`
\
-> ...sorts lines of text into ascending order (`-r` flag for descending order, `-n` for numeric instead of alphabetical order)

`source`
\
-> ...a Bash shell built-in command that executes the content of the file passed as an argument in the current shell. It has a synonym in `.` (period). ([cf. here](https://superuser.com/a/46146))

`time`
\
->

`uniq`
\
-> removes repeated, adjacent lines from a file (`-c` flag for showing the number of occurences)

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

`history`
\
-> ...shows your previously executed commands (`history | tail -n1` will print itself and its index)

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

`tr`
\
-> replaces some character with another; e.g. `echo "This is a string." | tr " " "\n"` replaces all whitespaces in the string with a new line character

`wc`
\
-> presumably stands for ›word count‹ and prints the number of lines, words, and characters in a file (options `-l`, `-w`, and `-c` limit the output)

`whoami`
\
->

## cut

`cut` lets you print columns from a text (file) input. One way to define what a column is, is by using the `-f` argument and cut by field. Fields are assumed to be tab-seperated, but you can specify the delimiter with the `-d` flag: `cut -d. -f1` will cut by `.`. The `-f` flag can take a number to specify which column to print; for the second, third and fourth column, we'd write `cut -f2,3,4` or `cut -f2-4`. With the `-c` flag we can cut columns by character count: `cut -c1-3`.

## grep

`grep` is used for searching and filtering strings based on an input string or regular expression. It actually stands for `global search for a regular expression and print out matched lines`. For inverse searching (filtering out the elements not containing some string, use the `-v` flag.)

# Pattern-matching and variables

[...]

## Wildcards and globbing

In the Linux shell, the wildcard operator is `*`: `ls *.js` lists all javascript files. If you want a wildcard for only a single character, use `?`. Square brackets are used for matching characters from a list, so `ls *.[jt]s` would list all Javascript and Typescript files for example.

It's the shell, not the invoked program, that performs this pattern-matching. Therefore, different shells might treat your commands differently. While `echo *.js` in Linux shell will echo all files ending with `.js`, Windows Powershell will literally just echo ›\*.js‹.

## Environment variables

You can use `printenv` for printing environment variables: `printenv HOME`. When using these variables in a command you will have to put a `$` before: `cd $HOME`. The Linux shell will then resolve the variable. System-wide environment variables should usually be stored in `/etc/environment`.

# Useful tools and combinations

## Piping

In order to combine commands, you will use a pipe operator (`|`). When combinng two commands, the commands are usually not aware that they are part of the pipeline as they are just handling ›standard inputs‹ (`stdin`) and ›standard outputs‹ (`stdout`). (There's excepetions like `ls`.)

Sending output to a file can be done with `>` (overwrites file) and `>>` (appends to file).

## Show hidden characters

For debugging purposes it's sometimes useful to show all characters in a file, even those that are not printable. You can do the with `cat -v` followed by the filename, which show's the ASCII representation of non-printable characters.

You can also use `od` which displays the contents of an input file, too, but lets you specify the character format. So `od -c` prints the file content in character format (additionally it prints the byte offset at the beginning of each line that it outputs).

## Mounting and unmounting

`lstblk`
\
-> This will list all block devices and their partitions (you can also use `blkid` alternatively). After you have identified, for example, the HDD you just connected, you can mount it to a specific target with:

`mount /dev/sda1 /media/myExternalHarddrive`

Unmounting it is done via `umount /dev/sda1`

<!--
## Syncing two folders

Bringing to folder in sync can be done with the `rsync` tool. I would usually run something like this:

```bash
rsync
```
-->

## Awk

`Awk` is a scripting mostly used for data manipulation. It's syntax is such:

```bash
awk options 'selection _criteria { action }' input-file > output-file
```

`Awk` reads its input file line by line and each line is treated as a ›record‹.

## Finding a running process

`ps -ef | grep processname`
\
-> pipe ps into grep, i.e. list the currently running processes, send the list to `grep` which searches for lines containing the pattern `processname` (as regular expression)

## Check size of folders

To check the size of the folders in the current folder (and excluding subfolders), run:

`du -sh --max-depth=1 ./*/`
\
(`-s` stands for summarize and `-h` for human-readable)

## Books

- Daniel J. Barrett: Efficient Linux at the Command Line (O'Reilly Media, 2022)
