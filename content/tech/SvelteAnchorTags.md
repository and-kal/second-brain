---
title: "SvelteKit: Making extra sure anchor tags work"
date: "2023-05-04"
draft: false
---

When using anchor tags to navigate to sections of a page, I had situations where certain mobile browsers will not do what they should and scroll to the desired section, but just stick to the top of the page. When I couldn't really predict this behavior and didn't know why this issue arises, I had to implement some fallback that will make sure your browser will scroll to the desired section. My solution was to use the `scrollIntoView()` method inside of SvelteKit's `onMount`, so that whenever the component is mounted, it will make sure you will be directed to the desired anchor.

```javascript
<script>
	import { page } from '$app/stores';
	import { onMount } from 'svelte';

	onMount(() => {
		const anchor = $page.url.hash.replace(/^\#/, '');
		document
			.getElementById(anchor ? anchor : "container")
			.scrollIntoView({
                behavior: 'instant',
                block: "start",
                inline: "nearest",
            });
	});
</script>

<nav>
	<a href="#section-1">Section 1</a>
	<a href="#section-2">Section 2</a>
	<a href="#section-3">Section 3</a>
</nav>

<main id="container">
	<section id="section-1">
		Section 1
	</section>

	<section id="section-2">
		Section 2
	</section>

	<section id="section-3">
		Section 3
	</section>
</main>

<style>
// ...
</style>
```
