---
title: "WordPress troubles"
date: "2023-10-03"
draft: false
---

Posting a couple of quirks in WordPress, that I'm likely to forget how to deal with them.

## wp-block-post-template-inline-css

When I migrated a WordPress blog from my local dev environment to a webhosting, certain CSS files were not included in the `<head>`, for example `wp-block-post-template-inline-css`. I couldn't find out what was causing this, but [in the WordPress support forum someone](https://WordPress.org/support/topic/WordPress-block-styles-not-loading-in-frontend/) had the same issue and the solution was to delete the `_transient_wp_core_block_css_files` entry from the `wp_options` table in your WordPress database.

## Get featured image of a blog post from REST API

If you want to fetch the featured image of a blog post, you will need to include `_embed` as a search param in your REST call: `curl https://example.com/wp-json/wp/v2/posts?_embed`. You will then be able to find the image nested in the response object: `response_object._embedded['wp:featuredmedia']['0'].source_url`. By adding the following to your `functions.php` you will get a `fimg_url` field directly on `response_object`:

```php
add_action('rest_api_init', 'register_rest_images' );
function register_rest_images(){
    register_rest_field( array('post'),
        'fimg_url',
        array(
            'get_callback'    => 'get_rest_featured_image',
            'update_callback' => null,
            'schema'          => null,
        )
    );
}
function get_rest_featured_image( $object, $field_name, $request ) {
    if( $object['featured_media'] ){
        $img = wp_get_attachment_image_src( $object['featured_media'], 'app-thumb' );
        return $img[0];
    }
    return false;
}
```

([source](https://dalenguyen.medium.com/how-to-get-featured-image-from-wordpress-rest-api-5e023b9896c6))
