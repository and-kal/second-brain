---
title: "Structure and Interpretation of Computer Programs (2nd ed.) by Harold Abelson & Gerald Jay Sussman"
tags: 
- coding
draft: true
---

(MIT Electrical Engineering and Computer Science, 1996)

## Building Abstractions with Procedures

computational processes/procedures manipulate data

*   they are descriptions of rules of manipulation
*   processes accord to a pattern of rules = a program

procedures and data can be combined and abstracted

Computer programming aids our expression of "procedural thoughts"

"complex programs are constructed by building, step by step, computational objects of increasing complexity"

name-object association (variables) are stored in an environment

> the evaluation rule is recursive in nature; that is, it includes, as one of its steps, the need to invoke the rule itself"

the environment also stores the machine instructions that do the operations associated with an operator ("+" -> addition -> machine instruction)

computer procedures describe how to do things, they don't describe properties of things
because they are imperative tasks that should be executed, they should be effective 

In order to find a solution for a problem, that problem is usually broken down into a series of subproblems. Accordingly, a procedure can be composed of several other procedures. Each of those sub-procedures solves a specific subproblem (or a part thereof). Sub-procedures should be self-contained, that is, one shuld be able to use them without knowing about how they are implemented.

* __environment is the context in which evaluation takes place__

(define _name_ _object_) is a "special form", no general evaluation

<!-- * "Numbers and arithmetic operations are primitive data and procedures."
* "Nesting of combinations provides a means of combining operations."
* "Definitions that associate names with values provide a limited means of abstraction." -->

"procedure definition" = function definition

general form of a procedure definition: 
`( define ( name ) ( formal parameters ) ) ( body ) )`

a procedure definition is a **special form** and exempt from the *general evaluation rule* and has its own evaluation rule


Procedures can have *formal parameters*, which can be used inside the body of the procedure. Procedures *bind* their formal parameters, so these parameters are *bound variables* and they are available only inside the *local scope* of the procedure. Variables that are not *scoped* or *bound* are *free variables*.

A procedure definition can have other definitions inside them. This nesting of definitions is called *block structure*. 

*lexical scoping*: ...

> A procedure is a pattern for the local evolution of a computational pro­cess. It specifies how each stage of the process is built upon the previous stage.

Computer programs deal with *process evolution*. In that, procedures define local evolution, while a process is the *global* evolution.

### conditional  expressions

`(cond (p1) (e1))` 

- *p1* is predicate
- *e1* is consequent expression
- together they form a *clause* 

`( if ( predicate ) ( consequent ) ( alternative ) )`

*logical composition operations*: `and`, `or`, `not`
- `not` is a procedure, `and` and `or` are special forms

### recursion

One speaks of a *recursive procedure* when a procedure is defined in terms of itself.

There's a difference between *recursive processes* and *recursive procedures*. "Recursive process" is a particular form of process evolution. 
Thus, it's no contradiction to say, iterative processes can be described by recursive procedures.

Recursive processes work by a *chain of deferred operations* which gets guilt and is then performed.


### iteration 

> In general, an iterative process is one whose state can be sum­marized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies con­ditions under which the process should terminate. 

Iterative processes have states.

## LISP specificialities

*   uses prefix notation
    *   (_operator_ _...operands_)
*   processes can be treated as data as well
*   every expression has a value
*   LISP programs are usually composed of several simple procedures
* LISP has a comparatively simple syntax
* Lisp uses *applicative-order evaluation* (not *normal-order evaluation*)
* case analysis is done with `cond`
* function definitions in LISP are not hoisted, so they need to be defined before being used
## Trivia

* _syntactic sugar_ is a phrase coined by Peter Landin.
* The idea of block structure originated with the programming language Algol 60.