# nokogiri_bang_finders

This gem says "Nokogiri, if you can't find XML I want, yell about it."

Specifically, it adds the following methods:

- `at!`
- `at_xpath!`
- `at_css!`

...to `Nokogiri::XML::Node` and `Nokogiri::XML::NodeSet`.

Each method just calls its non-bang namesake and, if the result is `nil`, raises `Nokogiri::XML::NotFound`.

This gem is so tiny, you could just copy and paste its code. But if it's convenient, use it. :smile:

## Installation

    $ gem install nokogiri_bang_finders

... or via Bundler.

## Usage

Use these methods just like you would use the normal Nokogiri versions, but expect an exception if the XML doesn't contain what you're looking for.