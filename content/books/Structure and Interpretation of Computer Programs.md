---
title: "Structure and Interpretation of Computer Programs (2nd ed.) by Harold Abelson & Gerald Jay Sussman"
tags: 
- coding
---

(MIT Electrical Engineering and Computer Science, 1996)

## Building Abstractions with Procedures

computational processes/procedures manipulate data

*   they are descriptions of rules of manipualtion
*   processes accord to a pattern of rules = a program

procedures and data can be combined and abstracted

Computer programming aids our expression of "procedural thoughts"

"complex programs are constructed by building, step by step, computational objects of increasing complexity"

name-object association (variables) are stored in an environment

> the evaluation rule is recursive in nature; that is, it includes, as one of its steps, the need to invoke the rule itself"

the environment also stores the machine instructions that do the operations associated with an operator ("+" -> addition -> machine instruction)

* __environment is the context in which evaluation takes place__

(define _name_ _object_) is a "special form", no general evaluation

<!-- * "Numbers and arithmetic operations are primitive data and procedures."
* "Nesting of combinations provides a means of combining operations."
* "Definitions that associate names with values provide a limited means of abstraction." -->

"procedure definition" = function definition

general form of a procedure definition: 
`( define ( name ) ( formal parameters ) ) ( body ) )`

a procedure definition is a **special form** and exempt from the *general evaluation rule* and has its own evaluation rule

### conditional  expressions

`(cond (p1) (e1))` 

- *p1* is predicate
- *e1* is consequent expression
- together they form a *clause* 

`( if ( predicate ) ( consequent ) ( alternative ) )`

*logical composition operations*: `and`, `or`, `not`
- `not` is a procedure, `and` and `or` are special forms
## LISP specificialities

*   uses prefix notation
    *   (_operator_ _...operands_)
*   processes can be treated as data as well
*   every expression has a value
*   LISP programs are usually composed of several simple procedures
* LISP has a comparatively simple syntax
* Lisp uses *applicative-order evaluation* (not *normal-order evaluation*)
* case analysis is done with `cond`
## Trivia

* _syntactic sugar_ is a phrase coined by Peter Landin