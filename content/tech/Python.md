---
title: "Python notes"
date: "2024-02-21"
draft: false
tags:
    - Python
---

# Using different versions of Python on Windows

If you have several versions of Python installed, you should be able to list them with `py --list`, which yields something like:

```shell
 -V:3.11 *        Python 3.11 (64-bit)
 -V:3.9           Python 3.9 (64-bit)
 -V:2.7           Python 2.7
```

You can then work with the different versions by writing `py -{version_number}`. So to install `pip` for an earlier version of Python, you would write: `py -3.9 -m ensurepip --upgrade`.

Another alternative is using `pyenv`: [github.com/pyenv/pyenv](https://github.com/pyenv/pyenv).

[You might also consider using [uv](https://emily.space/posts/251023-uv).]

# Keyword-only and positional-only arguments

In Python you can just mix positional and keyword arguments. (Just make sure that the positional arguments come first.) However, you can also force arguments to work keyword-only and positional-only, respectively.

`*` marks keyword-only (i.e., named) parameters. Arguments after `*` must be passed as keyword arguments.

`/` marks positional-only parameters. Arguments before `/` must be passed positionally and cannot be used as keyword arguments

So you can write something like this: 

```python
def foo(a, b, /, c, d, *, e, f):
    ...
```

So `a` and `b` can only be passed positionally; `c` and `d` can be passed positionally and by keyword; and `e` and `f` can only be passed by keyword.

[[source](https://blog.edward-li.com/tech/advanced-python-features/)]

# For-else statements

Python has a convenient for-else statement, that let's you handle breaks in for loops:

```python
for server in servers:
    if server.check_availability():
        primary_server = server
        break
else:
    primary_server = backup_server
``` 

Only if no server was found, the `else` will be evaluated.

# High-level structure of a Python project

*[The following is ostly AI generated. Sorry for forcing that on you, but I like the suggested structure for building a API with Python.]*

So I recently had Cursor IDE generate some boilerplate for building an API in Python for me, where the suggested structure of the app folders was the following:

- /app/adapters/
    - Boundary to external systems (APIs, S3, etc.).
    - Wrap vendor SDKs/HTTP calls into small, pure functions (send_message, put_object, presign_get).
    - Keep provider-specific details isolated from the rest of the app.
- /app/domain/
    - App/business logic that's provider-agnostic (render keyboards/captions, recommend items, policies).
    - Should not import SDKs or infrastructure; depends only on pure utilities and data types.
- /app/jobs/
    - Background tasks for slow/async work (e.g., AI processing, batch tasks, stuff run by RQ workers).
    - Pure function entrypoints that the queue calls; may notify users upon completion.
- /app/models/
    - ORM models (tables, relationships).
    - Define your schema shape used by the backend (users, media_assets, etc.).
- /app/routers/
    - HTTP routes and webhook endpoints (request/response layer), e.g. with FastAPI.
    - Thin controllers: validate inputs, call services/domain/adapters, return responses.
- /app/services/
    - Application services and orchestration helpers (repository, idempotency, S3 utils where higher-level).
    - Coordinate between domain logic, adapters, and models without exposing vendor details to routers.
- /app/config.py
    - Centralized settings
    - Exposes a single settings object.
- /app/deps.py
    - Infrastructure dependencies and factories
- /app/main.py
    - Application entrypoint