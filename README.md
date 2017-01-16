# Jekyll tag - List of posts based on tags

This is a liquid tag that lets you add a list of relevant posts into the current post based on its tags. Each element of the list contains the title of the post and the date released.

You define the number of posts to be shown.

## Installation

 Like every Jekyll plugin, simply add the .rb file into the _plugins folder of your Jekyll website.
 
## How to use the tag

 Add the tag in your templates like this: {% relevant_posts_list N %} where N is the number of the relevant posts you want to show.
 
 Example:
 
 ```
 {% relevant_posts_list 5 %}
 ```

## Author

Christos Monogios - [My personal blog](http://www.christosmonogios.com)

## Licence

MIT
