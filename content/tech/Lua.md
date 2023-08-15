---
title: "Notes on the Lua programming language"
date: "2023-05-30"
draft: true
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

## Uses

- Building a web application with Lua using [Lapis](https://leafo.net/lapis/) and [OpenResty](https://openresty.org/en/getting-started.html)
- Build a 2D game in Lua with [LÖVE](http://love2d.org/)


## sources

- [Matt Blewitt: Lua. The Little Language That Could](https://matt.blwt.io/post/lua-the-little-language-that-could/)
- [Tyler Neylon: Learn Lua in 15 Minutes](https://tylerneylon.com/a/learn-lua/)