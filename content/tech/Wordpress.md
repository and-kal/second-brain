---
title: "WordPress snippets I might need again at some point."
date: "2024-06-25"
draft: false
---

# Polylang language in REST API

Polylang is a popular multilinguality plugin for WordPress. The pro version of it also provides some additional REST API endpoints. So in the regular version a request like the following will return all posts and just ignore the `lang` parameter:

```sh
GET /wp/v2/posts?lang=en
```

Still, you can filter by language by adding a ustom REST field through your themes `functions.php`:

```php
function my_theme_filter_rest_post_query( $args, $request ) {
	$lang_parameter = $request->get_param('lang');

	if ( isset( $lang_parameter ) ) {
		$args['lang'] = $lang_parameter; // https://polylang.pro/doc/developpers-how-to/#query
	}

	return $args;
}
add_filter( 'rest_post_query', 'my_theme_filter_rest_post_query', 10, 2 );
add_filter( 'rest_page_query', 'my_theme_filter_rest_post_query', 10, 2 );
//add_filter( 'rest_{my_custom_posttype}_query', 'my_theme_filter_rest_post_query', 10, 2 ); // Custom posttype

add_action( 'rest_api_init', function () {

	register_rest_field( 'post', 'language', my_theme_register_postlanguage_function() );
	register_rest_field( 'page', 'language', my_theme_register_postlanguage_function() );
	//register_rest_field( '{my_custom_posttype}', 'language', my_theme_register_postlanguage_function() ); // Optional: Custom posttype

});

function my_theme_register_postlanguage_function() {
	return array(
		'methods'         => 'GET',
		'get_callback'    => 'my_theme_get_postlanguage_function',
		'schema'          => null,
	);
}

function my_theme_get_postlanguage_function( $data ) {
	$post_id = $data['id'];
	return ( function_exists( 'pll_get_post_language' ) ? pll_get_post_language( $post_id ) : null );
}
```

_This code was originally written by [them-es](https://gist.github.com/them-es/3ab1aa674fdb1829a3079f09559c8614)._

# ACF fields in REST API

ACF is another popular WordPress plugin for adding custom fields to WP posts and pages (you can add a short summary, social links etc. etc. for example). These fields are also not included in the standard WP REST API, even if in the ACF settings you activate `Show In REST API` in the respective field group (even though [according to the ACF documentation](https://www.advancedcustomfields.com/resources/wp-rest-api-integration/) it should).

Again, you can add a simple snippet to the `functions.php` file in order to retrieve the acf fields, too:

```php
function acf_to_rest_api($response, $post, $request) {
    if (function_exists('get_fields') && isset($post->id)) {
        $response->data['acf'] = get_fields($post->id);
    }
    return $response;
}
add_filter('rest_prepare_post', 'acf_to_rest_api', 10, 3);
```

(_This code was taken from [here](https://stackoverflow.com/a/57501896/20232056)._)

Try `GET /wp/v2/posts` and every post should now have your custom fields from AC included.

# Redirect frontend to elsewhere

When using a headless WordPress setup, I ran into a situation where I wanted to have the WordPress admin section be served on `www.example.com/wp-admin`, but visitors should not be allowed to go see any WordPress frontend under `www.example.com`. Instead they should be redirected to the new frontend I host under `www.elpmaxe.com`. In order to do that I built a super minimal theme which only redirects frontend traffic and does nothing else (for which I used [this solution](https://WordPress.stackexchange.com/a/17973)):

- under `themes/`create a folder called `redirect`
- add a `style.css` and an `index.php` to it
- `style.css` should look like this:
  ```php
  /*
     Theme Name: Redirect
     Description: Redirects the front end to domain.com
  */
  ```
- `style.css` should look like this:
  ```php
  <?php
       header( "Location: https://www.elpmaxe.com" );
  ?>
  ```
- activate the theme in the admin UI.
