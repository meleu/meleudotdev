---
dg-publish: true
---
# ruby nokogiri

```shell
# install nokogiri gem
gem instal nokogiri
```

```ruby
require 'open-uri'
require 'nokogiri'

url = 'https://www.lewagon.com'
html = URI.open(url)
doc = Nokogiri::HTML.parse(html)

# getting what you want with CSS selectors
doc.search(css_selector)
```

The output of `#search` is a Nokogiri nodeset
```ruby
elements = doc.search('.my-class')
elements.class #=> Nokogiri::XML::NodeSet
```

Getting a the url from a link:
```ruby
elements[0].attribute('href').value
```


## references

- <https://kitt.lewagon.com/knowledge/cheatsheets/nokogiri>
