---
title: "Planka on an Apache server"
date: "2025-06-02"
draft: false
tags:
  - selfhosting
---

Since Atlassian has been restricting their free plan for Trello a while ago, I was checking for some self-hosted alternatives and stumbled upon [Planka](https://planka.app/), which was ticking a lot of my boxes (especially, the Trello import feature seemed useful). However, [their docs for making it run with Apache2 as a reverse proxy](https://docs.planka.cloud/docs/configuration/reverse-proxy/apache2) are a bit scanty still. 

Planka should be running on the same server as my website and be accessible from `https://planka.myparty.de` subdomain. So I set up these two config files. 

```conf
# planka.conf
<VirtualHost *:80>
    ServerName planka.myparty.de

    RewriteEngine On
    RewriteRule ^/?(.*) https://planka.myparty.de/$1 [R=301,L]
</VirtualHost>
```
```conf
# planka-le-ssl.conf
<IfModule mod_ssl.c>
<VirtualHost *:443>
    ServerName planka.myparty.de
    ServerAdmin info@myparty.de

    ProxyPreserveHost On
    ProxyRequests Off
    SSLProxyEngine on

    # Proxy WebSocket explicitly
    ProxyPass "/socket.io/" "ws://127.0.0.1:3000/socket.io/"
    ProxyPassReverse "/socket.io/" "ws://127.0.0.1:3000/socket.io/"

    # Proxy regular HTTP
    ProxyPass "/" "http://127.0.0.1:3000/"
    ProxyPassReverse "/" "http://127.0.0.1:3000/"

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/planka.myparty.de/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/planka.myparty.de/privkey.pem
    Include /etc/letsencrypt/options-ssl-apache.conf

    ErrorLog ${APACHE_LOG_DIR}/planka_error.log
    CustomLog ${APACHE_LOG_DIR}/planka_access.log combined
</VirtualHost>
</IfModule>
```

I use port 3000 here, but you should check again under which port it is actually running, e.g. by trying `docker ps` and check the port mappings. Also, I'm assuming here that you know how to set up SSL and enabled your sites. If not, check the [article on self-hosting listmonk](./listmonkapache).

[Some users reported](https://github.com/plankanban/planka/issues/223) they also had to pass in the following directives in the `docker-compose.yml`:
```
services:
    planka:
        ...
        environment: 
            - BASE_URL=https://myparty.de
            - TRUST_PROXY=1 
            ...    
        ...
    ...
...
```