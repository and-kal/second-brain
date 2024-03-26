---
title: "Some design patterns implemented in JavaScript"
date: "2024-03-26"
draft: true
---

# Singleton pattern

With the singleton pattern you make sure that a class only gets instantiated once. Using this pattern you would rewrite the following code:

```javascript
class DBConnection {
  constructor(uri) {
    this.uri = uri
  }

  connect() {
    console.log(`DB ${this.uri} has been connected!`)
  }

  disconnect() {
    console.log("DB disconnected")
  }
}

const connection = new DBConnection("mongodb://...")
```

...like so:

```javascript
let connection

class DBConnection {
  constructor(connection) {
    if (connection) {
      throw new Error("You can only create one instance!")
    }
    this.uri = uri
    connection = this
  }

  connect() {
    console.log(`DB ${this.uri} has been connected!`)
  }

  disconnect() {
    console.log("DB disconnected")
  }
}

const singletonConnection = Object.freeze(new DBConnection("mongodb://..."))

export default singletonConnection
```

Now there can be only one instance of `DBConnection`, which is also not modifiable.

<!-- This pattern is rather controversial. An alternative way to achieve the same would be ... -->

# Proxy pattern

With proxies you can intercept operations on an object (using so-called [›traps‹](https://javascript.info/proxy#default-value-with-get-trap)). This is useful, if you want to prevent direct interactions with an object via its internal methods and write custom methods (for example getters and setters).

```javascript
import { isValidEmail, isAllLetters } from "./validator.js"

const user = {
  firstName: "John",
  lastName: "Doe",
  username: "johndoe",
  age: 42,
  email: "john@doe.com",
}

const userHandler = {
  get: (target, prop) => {
    console.log(`${new Date()} | The value of ${prop}} is ${target[prop]}`)
    return target[prop]
  },
  set: (target, prop, value) => {
    if (prop === "username" && !(typeof prop == "string")) {
      console.error(`${prop} has to be a string.`)
      return false
    }
    if (prop === "age" && !(typeof prop == "number") && prop < 18) {
      console.error(`${prop} has to be a number, and has to be at least 18.`)
      return false
    }
    console.log(`Changed ${prop} from ${target[prop]} to ${value}`)
    target[prop] = value
    return true
  },
}

const userProxy = new Proxy(user, userHandler)
```

# Factory pattern

This pattern uses functions that create a new object everytime they are invoked. It's not really a pattern in JavaScript as it would be in other, OO programming languages.

```javascript
export const createBook = (title, author, isbn) => {
  return {
    title,
    author,
    isbn,
  }
}

const book1 = createBook("The Great Gatsby", "F. Scott Fitzgerald", "CD456")
const book2 = createBook("Moby-Dick", "Herman Melville", "EF789")
```

# sources

- [javascriptpatterns.vercel.app](https://javascriptpatterns.vercel.app/patterns/design-patterns/proxy-pattern)
- Alexander Shvets: Dive Into Design Patterns (2019)
