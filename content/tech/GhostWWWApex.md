---
title: "Setting up a www subdomain on a self-hosted Ghost blog"
date: "2024-05-22"
draft: false
---

[Ghost](https://ghost.org) CMS makes it fairly easy to link your blog to your own domain and set up SSL. The `ghost setup` command in [ghost-cli](https://ghost.org/docs/ghost-cli/) basically does it for you. However, for me it didn't automatically set up a www subdomain. So I could access, say, `https://myblog.lol`, but `https://www.myblog.lol` would result in a `502`. I was thinking of just adding a CNAME or ALIAS record in my provider's DNS settings, but that didn't work somehow. So I just set an A record to point from www to the IP of my Ghost blog, which worked fine, but I didn't have any SSL then on my www subdomain. Thus, I had to tinker a bit in the nginx configs of Ghost, so that it automatically redirects all www traffic to the apex. I think that that's a pretty safe solution.

First, I would configure the www url by `cd`ing into `/var/www/ghost` and run `ghost config url https://www.myblog.lol`.
Then configure ssl via `ghost setup nginx ssl`. Set my config again to the apex domain with `ghost config url https://myblog.lol`. And now you will have to edit the nginx configs in `/etc/nginx/sites-available`. Go there, and if there are no files called `www.myblog.lol-ssl.conf` **and** `www.myblog.lol.conf` create them. The first one will have to look like this:

```bash
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name www.myblog.lol;
    root /var/www/ghost/system/nginx-root;

    ssl_certificate /etc/letsencrypt/www.myblog.lol/fullchain.cer;
    ssl_certificate_key /etc/letsencrypt/www.myblog.lol/www.myblog.lol.key;
    include /etc/nginx/snippets/ssl-params.conf;

    location / {
        return 301 https://myblog.lol$request_uri;
    }

    location ~ /.well-known {
        allow all;
    }

    client_max_body_size 1g;
}
```

The latter one should be this:

```bash
server {
    listen 80;
    listen [::]:80;

    server_name www.myblog.lol;
    root /var/www/ghost/system/nginx-root; # Used for acme.sh SSL verification (https://acme.sh)

    location / {
       return 301 https://myblog.lol$request_uri;
    }

    location ~ /.well-known {
        allow all;
    }

    client_max_body_size 50m;
}
```

That's it. Run `sudo nginx -t` to make sure you don't have any typo in your config files and then source your config files with `sudo nginx -s reload`. You might have to do `ghost restart`, if your www subdomain does not work immediately.
