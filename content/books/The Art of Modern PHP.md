---
title: "The Art of Modern PHP 8 (2021) by Joseph Edmonds"
date: "2023-02-07"
draft: true
---

## OOP lessons

**Public properties** are not very common and not considered good practice. It's better to implement getters and setters. (Except for when we're dealing with *class constants* as they are read-only by default and therefore safe to be declared as public.)

**Dynamically assigned properties** are also very uncommon and usually a mistake - they will always be public and untyped:

```php
class SimplePropertyAssignment {
    private string $defined = 'defaultValue';
    public function __construct(
            private string $constructorParam = 'constructorValue'
        ) {
        $this->dynamicProperty = 'dynamicallyAdded'; // bad idea - 'SimplePropertyAssignment->dynamicProperty' will be public and untyped
    }
}
```

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

**Encapsulation**: "...the general wisdom is that you should keep as much as possible hidden away and only expose the minimum amount of functionality and data in order to maximize your freedom to refactor."

There's three levels of **visibility** in PHP: *private*, *protected*, *public*. By default, methods and properties of a class will be *public*. Most of the time this is not desired and one should always set their methods and properties to *private* or *protected*.

OO PHP is based on **single inheritance** - multiple inheritance is not supported -, which means that a child can have only one parent (while parents can have multiple children). 

Classes that are marked as *final* cannot be inherited from.

<!-- 
**Abstract Classes and Methods**

```php
abstract class MyClass
{
    abstract protected int $foo = 1;
}
``` 
-->

## PHP Standards Recommendations

Check [https://www.php-fig.org/psr/](https://www.php-fig.org/psr/).
