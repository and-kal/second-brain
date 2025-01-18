---
title: "Python commands"
date: "2024-02-21"
draft: false
---

# Using different versions of Python on Windows

If you have several versions of Python installed, you should be able to list them with `py --list`, which yields something like:

```shell
 -V:3.11 *        Python 3.11 (64-bit)
 -V:3.9           Python 3.9 (64-bit)
 -V:2.7           Python 2.7
```

You can then work with the different versions by writing `py -{version_number}`. So to install `pip` for an earlier version of Python, you would write: `py -3.9 -m ensurepip --upgrade`.

Another alternative is using `pyenv`: [github.com/pyenv/pyenv](https://github.com/pyenv/pyenv)
