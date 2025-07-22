---
title: "Structure and Interpretation of Computer Programs (2nd ed.) by Harold Abelson & Gerald Jay Sussman"
draft: true
tags:
  - coding
  - reading notes
---

(MIT Electrical Engineering and Computer Science, 1996)

## Building Abstractions with Procedures

computational processes/procedures manipulate data

- they are descriptions of rules of manipulation
- processes accord to a pattern of rules = a program

procedures and data can be combined and abstracted

Computer programming aids our expression of "procedural thoughts"

"complex programs are constructed by building, step by step, computational objects of increasing complexity"

name-object association (variables) are stored in an environment

> the evaluation rule is recursive in nature; that is, it includes, as one of its steps, the need to invoke the rule itself"

the environment also stores the machine instructions that do the operations associated with an operator ("+" -> addition -> machine instruction)

computer procedures describe how to do things, they don't describe properties of things
because they are imperative tasks that should be executed, they should be effective

In order to find a solution for a problem, that problem is usually broken down into a series of subproblems. Accordingly, a procedure can be composed of several other procedures. Each of those sub-procedures solves a specific subproblem (or a part thereof). Sub-procedures should be self-contained, that is, one shuld be able to use them without knowing about how they are implemented.

- **environment is the context in which evaluation takes place**

(define _name_ _object_) is a "special form", no general evaluation

<!-- * "Numbers and arithmetic operations are primitive data and procedures."
* "Nesting of combinations provides a means of combining operations."
* "Definitions that associate names with values provide a limited means of abstraction." -->

"procedure definition" = function definition

general form of a procedure definition:
`( define ( name ) ( formal parameters ) ) ( body ) )`

a procedure definition is a **special form** and exempt from the _general evaluation rule_ and has its own evaluation rule

Procedures can have _formal parameters_, which can be used inside the body of the procedure. Procedures _bind_ their formal parameters, so these parameters are _bound variables_ and they are available only inside the _local scope_ of the procedure. Variables that are not _scoped_ or _bound_ are _free variables_.

A procedure definition can have other definitions inside them. This nesting of definitions is called _block structure_.

_lexical scoping_: ...

> A procedure is a pattern for the local evolution of a computational pro­cess. It specifies how each stage of the process is built upon the previous stage.

Computer programs deal with _process evolution_. In that, procedures define local evolution, while a process is the _global_ evolution.

### conditional expressions

`(cond (p1) (e1))`

- _p1_ is predicate
- _e1_ is consequent expression
- together they form a _clause_

`( if ( predicate ) ( consequent ) ( alternative ) )`

_logical composition operations_: `and`, `or`, `not`

- `not` is a procedure, `and` and `or` are special forms

### recursion

One speaks of a _recursive procedure_ when a procedure is defined in terms of itself.

There's a difference between _recursive processes_ and _recursive procedures_. "Recursive process" is a particular form of process evolution.
Thus, it's no contradiction to say, iterative processes can be described by recursive procedures.

Recursive processes work by a _chain of deferred operations_ which gets guilt and is then performed.

### iteration

> In general, an iterative process is one whose state can be sum­marized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies con­ditions under which the process should terminate.

Iterative processes have states.

### parameters

In order for a procedure to run, if usually needs paramterers. There's two types of parameters: _formal parameters_ are those that are used in the definition of a procedure, _actual parameters_ are the _arguments_ passed to a procedure when invoking it.

### Lambda functions

Lambda functions are easy to visualize by using the _substitution model of procedure application_.

```lisp
(define (square x) (* x x))

(define (square-of-square a)
  (* (square a) (square a))
)
```

Now, when call `(square-of-square 5)`, we can reduce this function to subprocedures:

- `(* (square 5) (square 5))`
- `(* (* 5 5) (* 5 5))`
- `(* 25 25)`
- `625`

(Note that this is not how the LISP interpreter works. It is just helping us to visualize the evaluation. (cf. p. 15))z

We can use _lambdas_ to create procedures on-the-fly. These procedures are _anonymous_, i.e. they are not named.

```lisp
[...]
```

cf. [Exercise 2.4](../static/LISP_exercises/exercise2.4.lisp)

### Closure property

An operation is said to have the _closure property_ if it lets you combine data in such a way that the result can again be combined by the same operation.z

## LISP specificialities

- uses prefix notation
  - (_operator_ _...operands_)
- processes can be treated as data as well
- every expression has a value
- LISP programs are usually composed of several simple procedures
- LISP has a comparatively simple syntax
- Lisp uses _applicative-order evaluation_ (not _normal-order evaluation_)
- case analysis is done with `cond`
- function definitions in LISP are not hoisted, so they need to be defined before being used

## Trivia

- _syntactic sugar_ is a phrase coined by Peter Landin.
- The idea of block structure originated with the programming language Algol 60.
