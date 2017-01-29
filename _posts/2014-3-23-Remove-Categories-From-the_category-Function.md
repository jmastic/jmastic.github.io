---
layout: post
title: Remove categories from Wordpress "the_category" function
---

This is a somewhat pointed issue, but I just ran into it so I figured I'd share the solution I found.

I have a category that I use to control which posts show up in the Orbit slider that is on my site’s homepage. I didn't necessarily want that category showing up in those posts’ category lists, so I did some quick searching and found a good solution.

Here is a repost of the code I added to my theme's *functions.php* that was found on [Smashing Themes](http://www.smashingthemes.com/blog/how-to-remove-categories-from-the_category-function-in-wordpress/).

```
function the_category_filter($thelist,$separator=' ') {
    if(!defined('WP_ADMIN')) {
        //Category Names to exclude
        $exclude = array('Featured - Home Slider', 'Uncategorized', 'Private');
         
        $cats = explode($separator,$thelist);
        $newlist = array();
        foreach($cats as $cat) {
            $catname = trim(strip_tags($cat));
            if(!in_array($catname,$exclude))
                $newlist[] = $cat;
        }
        return implode($separator,$newlist);
    } else {
        return $thelist;
    }
}
add_filter('the_category','the_category_filter', 10, 2);
```

This was a very quick and easy fix, so a big thanks to Abdullah Ibrahim at Smashing Themes for the post! The code may be old, but it still does the trick!
