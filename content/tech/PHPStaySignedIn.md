---
title: "PHP: Implementing a ›Remember me‹ function"
date: "2023-05-02"
draft: false
---

There's surprisingly little articles out there, which explain how to securely keep a user logged in by using cookies in PHP. (Or if there is one, it's only [in the web archive](https://web.archive.org/web/20110219130748/http://jaspan.com/improved_persistent_login_cookie_best_practice).) Even some articles claiming to show the [best approach](https://www.geeksforgeeks.org/best-approach-for-keep-me-logged-in-using-php/) to do so, [will advise you](http://www.phpnerds.com/article/using-cookies-in-php/2) to e.g. store the MD5-hashed username and password in a client-side cookie (via the `setcookie()` function), which is actually [not a good practice](https://stackoverflow.com/a/17266448). If you can avoid it (and in most cases you really can) you shouldn't let user information like their password leave the server. All you need to have in a cookie is:

- something to identify the user with (like their UID),
- a 'remember me' token,
- a _MAC_ (message authentication code), which is generated server-side by using a hashing algorithm on the two components above.

The token is gonna be stored in the database mapped to the user ID. You can now use that cookie to check your database for the user via the ID and see if they have the respective 'remember me' token.

Furthermore, you are able to check if the cookie was generated on your server by comparing the MAC from the cookie with the result of running the same hashing algorithm on the user id and token that are in the cookie that the user sends and see if they are equal. There's [an answer on StackOverflow](https://stackoverflow.com/questions/1354999/keep-me-logged-in-the-best-approach/17266448#17266448) that demonstrate a way to implement this and also offers some exra context.

As for best practices and an additional security layer, you can also generate a new token each time the user loads the page and overwrite the old one in the cookie and in your database (as to keep it ever changing), so if a hacker gets hold of your cookie it's already invalid once you re-visit the page.

When you follow this approach, you don't need to [add any more salt](https://excellium-services.com/2021/01/18/password-hashing-be-careful-about-what-you-hash/) to your cookie. By [hashing](https://www.php.net/manual/en/function.hash-hmac.php) the unique identifier and the token with an sha256 algorithm – using some secret key that you have stored on your server, e.g. in an environment variable – and storing that in the cookie for comparing it later on with what your server yields, you are already on really safe terrain.
