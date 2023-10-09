---
title: "Wordpress troubles"
date: "2023-10-03"
draft: true
---

Posting a couple of quirks in Wordpress, that I'm likely to forget.

## wp-block-post-template-inline-css

When I migrated a Wordpress blog from my local dev environment to a webhosting, certain CSS files were not included in the `<head>`, for example `wp-block-post-template-inline-css`. I couldn't find out what was causing this, but [in the Wordpress support forum someone](https://wordpress.org/support/topic/wordpress-block-styles-not-loading-in-frontend/) had the same issue and the solution was to delete the `_transient_wp_core_block_css_files` entry from the `wp_options` table in your Wordpress database.