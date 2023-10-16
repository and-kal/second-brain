---
title: "Things I'm likely to forget about C#"
date: "2023-03-28"
draft: true
---

Constructors in C# are defined by implementing a method whose name is the same as the name of its type. An access modifier for the constructor is optional. It doesn't have a return type.

```csharp
public class Animal
{
   private string kind;

   public Animal(string species)
   {
      kind = species;
   }
   // ...
}
```

`internal` visibility in C# is used for classes or functions that should only be accessible within the same .exe or .dll (i.e. the same _assembly_).

In a `using` statement one instantiates an object and uses it inside the `using` block, e.g.:

```csharp
using(SqlHelper sqlHelper = new SqlHelper())
{
    sqlHelper.run();
}
```

This use of `using` has some features:

* The object is scoped and only available inside the statement.
* The object is read-only.
* At the end of the block the `Dispose()` method will be called (whether there was an exception or not) and all disposable instances will be disposed.

## Jump statements

- `break`: terminates the closest enclosing iteration statement (i.e. `for`, `foreach`, `do`, or `while` statement) or `switch` statement
- `continue`: starts a new run of the closest enclosing iteration statement

- `goto`: transfers control to a statement that is marked by a specific label
- `return`: terminates the execution of the function in which it appears and hands the control back to the caller (i.e. the process that called the function)

Exception-handling statements are not the same as jump statements

## Exception-handling statements

- `throw` statement
- `try-catch` statement
- `try-finally` statement
- `try-catch-finally` statement

## Type-level and value-level code

*Type-level code* is the part of the code that consists of types (`...` etc.) and type operators (`...` etc.), while *value-level code* is basically the rest of the code.

For example this is value-level code:

```csharp
...
```

While its *call signature* is type-level code:

```csharp
...
```

## Overloading

Overloading functions is quite common in C#. *Overloading* means having several call signatures for the same function, thus having different ways of calling a function dependent on the arguments just when calling the function.

## Generic type parameters

[...]