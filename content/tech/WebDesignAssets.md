---
title: "Web design assets for the hasty ones"
date: "2023-05-24"
draft: false
---

It doesn't take too much time and knowledge to design a simple-to-code, lightweight, easy-to-maintain website, blog or portfolio. You can achieve pretty good results by simply using some CSS framework and/or static sie generator and following along their respective documentations.
Inspired by [this talk at Erfa Essen](https://media.ccc.de/v/petitfoo-webseiten-bauen) (in German) I compiled a bunch of resources for easy, low-level web design purposes. Basically no JavaScript knowledge's required, only a bit of HTML and CSS.

- [CSS templates](#css-templates)
- [CSS frameworks](#css-frameworks)
- [Colours, shapes, etc.](#colours-shapes-etc)
- [Website builders](#website-builders)
- [Static Site Generators](#static-site-generators)
- [Hosting services](#hosting-and-domains)
- [Content Management Systems](#content-management-systems)
- [other useful assets](#other-useful-assets)
- [Awesome Lists](#some-awesome-lists)

# Web design assets

## CSS templates

If you really just want to use a template and fill it with your content, or if you want to get a professional-looking website template to modify, here's some starting points:

- [HTML5Up](https://html5up.net/) - Customizable website templates in HTML5 + CSS3 (looks really slick and »up-to-date«)
- [IBM's Carbon Design System](https://www.carbondesignsystem.com/developing/frameworks/vanilla/) - very nice-looking alternative to Material Design; you can find a lot of website elements on their [CodePen](https://codepen.io/collection/XqRbEz/), ready to be copy-pasted
<!-- * [Creative Tim's free Bootstrap themes](https://www.creative-tim.com/bootstrap-themes/free/) -->

## CSS frameworks

Developing your own design and style system for a website can take a very long time and you might end up with a whole lot of custom CSS rules, media queries etc. for the single components of your page. From my experience, using a CSS frameworks will enhance this process quite a bit as those often come with a lot of defaults that just work visually and allow you to focus on certain aspects of your designs. Frameworks like Tailwind will also limit your choices with regards to sizes, spacing etc., which I find helpful in coming up with a consistent design. However, for most of these frameworks you will need to dedicate some time learning the syntax.

- [awesome-css-frameworks list](https://github.com/troxler/awesome-css-frameworks) - find a whole lot more here
- [Bulma](https://bulma.io/) - »a free, open source framework that provides ready-to-use front-end components that you can easily combine to build responsive web interfaces«
- [Fomantic-UI](https://github.com/fomantic/Fomantic-UI/) - an active fork of the seemingly deprecated Semantic-UI
- [Sakura](https://oxal.org/projects/sakura/) - »a minimal classless css framework / theme«
- [Tailwind](https://tailwindcss.com/) - I find this one quite accessible

### fun stuff

- [aesthetic-css](https://github.com/torch2424/aesthetic-css/) - Windows98 & XP style CSS framework
- [NES.css](https://github.com/nostalgic-css/NES.css/) - NES/Famicom style CSS framework
- [Presentation at Erfa Essen: ›Retro-Websites bauen‹](https://media.ccc.de/v/petitfoo-4241-retro-websites-bauen) - in German
- [PSone.css](https://github.com/98mprice/PSone.css/) - PlayStation 1 (Tekken, Final Fantasy VII) style CSS framework
- [win95.css](https://github.com/AlexBSoft/win95.css/) - Windows 95-style CSS template based on Bootstrap 4

## Colours, shapes, etc.

- [Adobe Color Wheel](https://color.adobe.com/create/color-wheel/) - really helpful in creating custom colour pallets
- [Colorhunt](https://colorhunt.co/)
- [CSS Hover Effects](https://ianlunn.github.io/Hover/) - collection of CSS hover effects
- [CSS Separator Generator](https://wweb.dev/resources/css-separator-generator/)
- [Fancy Border Radius](https://9elements.github.io/fancy-border-radius/) - easily create intricate shapes for your buttons, boxes etc.
- [Gradient Generator by Josh W Comeau](https://www.joshwcomeau.com/gradient-generator/)
- [Paletton](http://paletton.com/) - a similar tool to Adobe Color Wheel
- [randoma11y](https://randoma11y.com/) - generates a set of duotone colours with focus on readability/accessibility
- [Solarized](https://ethanschoonover.com/solarized/)
- [uiGradients](https://uigradients.com/)
- [Transparent Textures](https://www.transparenttextures.com/) - nice for website backgrounds and stuff

## Website builders

If you really don't want to do any coding at all, you can try one of these no-code website builders. They all offer free tiers with certain limitations; usually, you can only host one page and only on their servers/domains.

- [Readymag](https://readymag.com/)
- [Squarespace](https://squarespace.com)
- [straw.page](https://straw.page) - I really like this one; more brutalist than the others and extremely simple
- [Tilda](https://tilda.cc/)
- [webflow](https://webflow.com/)

## Static Site Generators

- [11ty/eleventy](https://www.11ty.dev/)
- [JAMStack themes](https://jamstackthemes.dev/) - a collection of collections of themes for several SSGs
- [Jekyll](https://jekyllrb.com/)
- [Pelican](https://docs.getpelican.com/)
- [Presentation at rC3 2021: › Make it static!‹](https://media.ccc.de/v/rc3-2021-cwtv-343-make-it-static)
- [many, many more SSGs](https://jamstack.org/generators/)

### Blogging

- [ʕ•ᴥ•ʔ Bear](https://bearblog.dev/) - a nice and simple blogging platform
- [Blot](https://blot.im/) - let's turn a folder into a website easily
- [Hexo](https://hexo.io/) - »A fast, simple & powerful blog framework«
- [Hugo](https://github.com/gohugoio/hugo/) - very powerful and fast once you have got a grip on it, but not exactly easy to learn for beginners
- [Paper.wf](https://paper.wf/)

## Hosting and Domains

- [afraid.org's FreeDNS](https://freedns.afraid.org/) - offers six subdomains for free from their vast portfolio of random and strange domains
- [glitch.me](https://glitch.com/features/) - simple and powerful platform for hosting, sharing, remixing and developing websites and web apps
- [neocities](https://neocities.org)
- [repl.it](https://replit.com/) - online REPL / IDE
- [sdfeu.org](https://sdfeu.org/w/tutorials:building_a_website) - you can host a website on the SDF Public Access Unix System, if you are a validated user (it will cost 5 Euros as a token of trust and it's really for a good cause)
- [Surge, Firebase, Vercel, Github Pages, Netlify](https://dev.to/afozbek/5-ways-to-host-your-applications-4d77/) are other popular options
- [tildepages.org](https://tildepages.org/) - you can host static pages on their [Pubnix](https://projectsegfau.lt/pubnix/faq) systems

## Content management systems

If you want to have your own CMS and run a blog or something, you can get some affordable managed webspace from [Uberspace](https://uberspace.de) for example. They offer a bunch of options along with step-by-step guides for setting up a CMS on their servers over at their [Uberlab CMS collection](https://lab.uberspace.de/tags/cms/). As for honorable mentions I also recommend this super light-weight CMS:

- [Lichen](https://lichen.sensorstation.co/) - »the simplest possible CMS for the web that is friendly enough for non-technical users«

## other useful assets

- [Animate.css](https://animate.style/)
- [Component Gallery](https://component.gallery/) - Ressource of components to be used in Vanilla JS or JS frameworks
- [CSS background design patterns](https://www.magicpattern.design/tools/css-backgrounds/)
- [Favic-o-Matic](https://favicomatic.com/)
- [google-webfonts-helper](https://google-webfonts-helper.herokuapp.com/fonts/) - helps you to host Google fonts locally instead of relying on Google APIs
- [Icon Buddy](https://iconbuddy.app) - customizable, open source SVG icons

## random stuff

- [Dither Me This](https://hekate2.github.io/buttonmaker/) - create dithered versions of your images
- [hekate2's button maker](https://hekate2.github.io/buttonmaker/) - get old school 88x31 buttons for your website
- [htmx](https://htmx.org) let's you use features like AJAX, caching, WebSockets, animations etc. directly in HTML
- [Quartz](https://quartz.jzhao.xyz/) (by Jacky Zhao) - sort of a boilerplate for a _digital garden_ based on Hugo and Obsidian (optional)
- [textcraft](https://textcraft.net/) - let's you generate flashy word art

---

## awesome lists

- [anderspitman/awesome-tunneling](https://github.com/anderspitman/awesome-tunneling)
- [b-long/awesome-static-hosting-and-cms](https://github.com/b-long/awesome-static-hosting-and-cms)
- [bayandin/awesome-awesomeness](https://github.com/bayandin/awesome-awesomeness)
- [brabadu/awesome-fonts](https://github.com/brabadu/awesome-fonts)
- [davidsonfellipe/awesome-wpo](https://github.com/davidsonfellipe/awesome-wpo)
- [emijrp/awesome-awesome](https://github.com/emijrp/awesome-awesome)
- [Famolus/awesome-sass](https://github.com/Famolus/awesome-sass)
- [instanceofpro/awesome-backbone](https://github.com/sadcitizen/awesome-backbone)
- [jnv/list](https://github.com/jnv/lists)
- [myles/awesome-static-generators](https://github.com/myles/awesome-static-generators)
- [obetomuniz/awesome-webcomponents](https://github.com/obetomuniz/awesome-webcomponents)
- [sindresorhus/awesome](https://github.com/sindresorhus/awesome)
- [sotayamashita/awesome-css](https://github.com/sotayamashita/awesome-css)
- [willianjusten/awesome-svg](https://github.com/willianjusten/awesome-svg)
