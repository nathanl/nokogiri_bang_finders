# nokogiri_bang_finders

This gem says "Nokogiri, if you can't find the XML I want, yell about it."

For example:

```ruby
doc = Nokogiri::XML("<root><aliens><alien><name>Alf</name></alien></aliens></root>")
doc.at('alien').content # => "Alf"

# without nokogiri_bang_finders
doc.at('robot').content # NoMethodError: undefined method `content' for nil:nilclass

# with nokogiri_bang_finders
doc.at!('robot').content # Nokogiri::XML::NotFound: '["robot"] in {snippet of the XML}'
```

Specifically, this gem adds the following methods to to `Nokogiri::XML::Node` and `Nokogiri::XML::NodeSet`:

- `at!`
- `at_xpath!`
- `at_css!`

Each method just calls its non-bang namesake and, if the result is `nil`, raises `Nokogiri::XML::NotFound`.

This gem is so tiny, you could just copy and paste its code. But if it's convenient, use it. :smile:

## Context

 When an exception is raised, its message includes some context from the document, to show "I was looking for your selector in a document that looks like this". By default, up to 200 characters of context are given.

You can specify an integer number of characters of context, like `Nokogiri::XML::BangFinders.context_length = 500`.

Or you can specify `:all` to get the whole document in the exception message (though this probably isn't a good idea for production code): `Nokogiri::XML::BangFinders.context_length = :all`

## Installation

    $ gem install nokogiri_bang_finders

... or via Bundler.

## Requiring

Be sure to `require 'nokogiri_bang_finders'` **after** you `require 'nokogiri'`. It expects `Nokogiri::XML::Node` and `Nokogiri::XML::NodeSet` to be defined so that it can add methods to them.

## Usage

Use these methods just like you would use the normal Nokogiri versions, but expect an exception if the XML doesn't contain what you're looking for.
