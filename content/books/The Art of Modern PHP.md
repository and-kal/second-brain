---
title: "The Art of Modern PHP 8 (2021) by Joseph Edmonds"
date: "2023-03-08"
---

## OOP lessons

**Public properties** are not very common and not considered good practice. It's better to implement getters and setters. (Except for when we're dealing with *class constants* as they are read-only by default and therefore safe to be declared as public.)

---

**Dynamically assigned properties** are also very uncommon and usually a mistake - they will always be public and untyped:

```php
class SimplePropertyAssignment {
    private string $defined = 'defaultValue';
    public function __construct(
            private string $constructorParam = 'constructorValue'
    ) {
        // bad idea - 'SimplePropertyAssignment->dynamicProperty' will be public and untyped
        $this->dynamicProperty = 'dynamicallyAdded'; 
    }
}
```
---

When a property accesses a variable or constants of its class, this variable or constant is called the **backing field** of that property.

---

**Interfaces** help to make sure that a class has certain methods for sure and that these methods will return certain types. (Specifying the return types is optional though.)
Example from W3 Schools:
```php
interface Animal {
  public function makeSound() : string;
}

class Cat implements Animal {
  public function makeSound() {
    echo "Meow";
  }
}
```
Interfaces contain functions with no bodies. Child classes *implement* interfaces. A class can implement multiple interfaces, but can only be derived from one abstract class.

---

**Encapsulation**: Encapsulation enables an object to hide data and functionalities from other pieces of code, for example by making them private. "[T]he general wisdom is that you should keep as much as possible hidden away and only expose the minimum amount of functionality and data in order to maximize your freedom to refactor." (That means it's easier to make changes to your code later, when you keep your objects independent from one another. It also prevents internal state of an object from being corrupted.)

There's three levels of **visibility** in PHP: *private*, *protected*, *public*. By default, methods and properties of a class will be *public*. Most of the time this is not desired and one should always set their methods and properties to *private* or *protected*.
A *protected field* is only accessible within the class in which it is declared and any class that is derived from it (i.e. *child classes*).

---

OO PHP is based on **single inheritance** - multiple inheritance is not supported -, which means that a child can have only one parent class (or *base class*), while parents can have multiple children. 

Classes that are marked as *final* cannot be inherited from.

---

**Methods**
Method is another name for a function of a class (or an instantiated object). The name of a method and its parameters are called **signature of a method**. However, *PHP doesn't support traditional method overloading*, which means a class cannot have multiple methods with the same name, even when their paramteres (and thus their signatures) differ. Thus signatures in PHP don't play a great role.

---

**Abstract Classes and Methods**
Abstract classes can only be parent/base classes for other derived/child classes. They can have fields, methods and properties, but no object can be instantiated directly from an abstract class. Abstract functions/methods can only exist in abstract classes, have no body and *must* be implemented in the child class.
```php
abstract class MyClass
{
    abstract protected int $foo = 1;
    abstract public function calculateSomething();
}
``` 

---

**Variadic function**
PHP supports variadic functions, i.e. functions that accept a non-determined number of arguments 

```php
function sum(int ...$nums): int
{
    return array_sum($nums);
}
```

---

**static**
*static* fields, properties, constructors and methods can be accessed directly via the class, without having to instatiate an object first.

```php
[...]
```

---

**Polymorphism**  
refers to a program's ability to use the correct method for an object based on its run-time type.
[...]

---

In PHP, all public and protected functions are *virtual* by default, that means child classes can override their parent's functions. In order to prevent that prepend the **final** keyword:
```php
[...]
```

---
**Enumeration**: *enum* is a data type. "An Enum defines a [...] type, which has a fixed, limited number of possible legal values." (php.net) They're useful for typechecking.
```php
enum Directions
{
    case Up;
    case Down;
    case Left;
    case Right;
}

function go_somewhere(Direction $direction) { 
  print $direction;
}
 
$value = Direction::Left;
go_somewhere($value);
```
There's *pure enums* and *backed enums*. In *backed enums* cases have a scalar equivalent.
```php
enum Directions
{
    case Up = "U";
    case Down = "D";
    case Left = "L";
    case Right = "R";
}

// this will print "U"
print Directions::Down->value;
```

## PHP Standards Recommendations

Check [https://www.php-fig.org/psr/](https://www.php-fig.org/psr/).

## PHP Security Guide

The [PHP Security Guide](https://privacyaustralia.net/phpsec/projects/guide).