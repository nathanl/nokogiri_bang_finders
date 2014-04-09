# nokogiri_bang_finders

This gem says "Nokogiri, if you can't find the XML I want, yell about it."

For example:

```ruby
doc = nokogiri::xml("<root><aliens><alien><name>alf</name></alien></aliens></root>")
doc.at('alien').content # => "alf"

# without nokogiri_bang_finders
doc.at('robot').content # nomethoderror: undefined method `content' for nil:nilclass

# with nokogiri_bang_finders
doc.at!('robot').content # nokogiri::xml::notfound: ["robots"] in
       <?xml version="1.0"?>
       <root>
         <aliens>
           <alien>
             <name>alf</name>
           </alien>
         </aliens>
       </root>
```

Specifically, this gem adds the following methods to to `Nokogiri::XML::Node` and `Nokogiri::XML::NodeSet`:

- `at!`
- `at_xpath!`
- `at_css!`

Each method just calls its non-bang namesake and, if the result is `nil`, raises `Nokogiri::XML::NotFound`.

This gem is so tiny, you could just copy and paste its code. But if it's convenient, use it. :smile:

## Installation

    $ gem install nokogiri_bang_finders

... or via Bundler.

## Requiring

Be sure to `require 'nokogiri_bang_finders'` **after** you `require 'nokogiri'`. It expects `Nokogiri::XML::Node` and `Nokogiri::XML::NodeSet` to be defined so that it can add methods to them.

## Usage

Use these methods just like you would use the normal Nokogiri versions, but expect an exception if the XML doesn't contain what you're looking for.
