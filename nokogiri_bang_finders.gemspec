# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nokogiri_bang_finders/version'

Gem::Specification.new do |spec|
  spec.name          = "nokogiri_bang_finders"
  spec.version       = NokogiriBangFinders::VERSION
  spec.authors       = ["Nathan Long"]
  spec.email         = ["nathanmlong@gmail.com"]
  spec.summary       = %q{Adds XML finders to Nokogiri that raise if nothing is found.}
  spec.description   = %q{Adds XML finders to Nokogiri that raise if nothing is found.}
  spec.homepage      = "https://github.com/nathanl/nokogiri_bang_finders"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", ">= 1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rake"
end
