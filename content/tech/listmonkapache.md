---
title: "listmonk newsletter manager on an Apache server"
date: "2024-11-05"
draft: false
tags:
  - selfhosting
---

Since we're living in times of [enshittification](https://pluralistic.net/2023/01/21/potemkin-ai/#hey-guys) and you can't trust newsletter services like Mailjet or Mailchimp anymore to be usable in a few years or months unless you are a company who can afford their services, it's good to look for other viable options - like selfhosting a newsletter manager. I'm using [listmonk](https://listmonk.app) for this as I found it is intuitive to use, fairly easy set up and the admin interface looks pleasingly non-bloated. You can simply install it with Docker. However, I was following [this guide](https://mumaritc.hashnode.dev/how-to-install-listmonk-using-binary-on-ubuntu-2204) for installing it with the binaries. You should be able to have it up and running pretty fast with this guide, but it doesn't say how to configure your Apache server for your listmonk installation.

My listmonk is running on the same server as my website and is accessible from a subdomain like `https://newsletter.myparty.de`. So I had to configure Apache as a reverse proxy that routes traffic coming to `newsletter.*` to the listmonk service which is running on port `9000` (if you followed the above tutorial).

First, in order to use Apache as a reverse proxy enable the respective modules:

`sudo a2enmod proxy proxy_http`

Next, create a seperate Apache config file with `sudo touch /etc/apache2/sites-available/newsletter.conf` and edit it with `sudo nano /etc/apache2/sites-available/newsletter.conf`, pasting in the following configurations:

```conf
<VirtualHost *:80>
    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:9000/
    ProxyPassReverse / http://127.0.0.1:9000/

    ServerName newsletter.myparty.de
    ServerAdmin info@myparty.de

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    RewriteEngine on
    RewriteCond %{SERVER_NAME} =list.pracht-ev.net
    RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
```

Now, we have to enable our new site: `sudo a2ensite newsletter` - and restart apache: `sudo systemctl restart apache2`. You also have to make sure, by the way, that you've got an A or AAAA record set up for the `newsletter.*` subdomain at your domain registrar, otherwise, in the next step, Certbot will complain.

So, enable HTTPS for your subdomain with `sudo certbot --apache`. Certbot will do everything for you and you should end up with a `newsletter-le-ssl.conf` file in your `sites-available` folder. Restart Apache again and make sure everything is running: `sudo systemctl status`.

listmonk should now be available under `https://newsletter.myparty.de`.

---

For reference, here's what your `config.toml` should basically look like:

```conf
[app]
address = "localhost:9000"
admin_username = "Qwertzuiop"
admin_password = "1234567890"

[db]
host = "localhost"
port = 5432
user = "newsletter"
password = "ASdfGHJKLÖä#"
database = "listmonk"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
params = ""
```
