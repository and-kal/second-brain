---
title: "Notes on the Lua programming language"
date: "2023-05-30"
draft: true
tags:
    - Lua
---

## Usage

As a scripting language

For other domain-specific languages, which will compile to Lua

(As a general purpose language?)

## Data types

There's eight data types in Lua:

- `nil`
- `boolean`
- `number`
- `string`
- `function`
- `userdata` (used to represent C data structures, or blocks of raw memory)`
- `thread` (for coroutines / [generators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator))
- `table` (an associative array data structure)

The latter three might not be as self-explanatory. `userdata` is used to represent C data structures, or blocks of raw memory, `thread` is used for coroutines aka. [generators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator)). `table` is an associative array (like an object in JavaScript) and it's the only data structure in Lua.

## Variables

By default, variables are global by default. In order to scope them, you will use `local`, like so:

```lua
function someFunction() {
    local someVariable = {1,2,3,4}
    -- someVariable is now local to the function scope
    ...
}
```

## Maths

For math operations in Lua there's the `math` library.

If you wanted to find out square root of π, you could write:

```lua
io.write("The square root of π is: ", math.sqrt(math.pi));
```

In Lua you have floor divison (`//`) and regular divions (`/`). Regular divion always returns a float.

```lua
4 / 2
-- 2.0
11 // 3
-- 3
```

## Tables

You can swap two elements in a table this this kind of pattern:

```lua
deck[pos], deck[#deck] = deck[#deck], deck[pos]
```

Tables in Lua are 1-indexed.

## String formatting

`string.format` is a tool for formatting string according to a certain directive. These directives are derived from the [format specifiers C standard library](https://www.freecodecamp.org/news/format-specifiers-in-c/).

## Pattern-matching

`string.gsub` is a function that lets you replace a pattern with a replacement string. ›gsub‹ stands for ›global substitution‹. It's parameters are:

- 1st: input string
- 2nd: regular expression
- 3rd: replacement string
- 4th: number of replacements (optional)

## Uses

- Building a web application with Lua using [Lapis](https://leafo.net/lapis/) and [OpenResty](https://openresty.org/en/getting-started.html)
- Build a 2D game in Lua with [LÖVE](http://love2d.org/)

## sources

- [Matt Blewitt: Lua. The Little Language That Could](https://matt.blwt.io/post/lua-the-little-language-that-could/)
- [Tyler Neylon: Learn Lua in 15 Minutes](https://tylerneylon.com/a/learn-lua/)
