# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diffable_array/version'

Gem::Specification.new do |spec|
  spec.name          = "diffable_array"
  spec.version       = DiffableArray::VERSION
  spec.authors       = ["Dan Barber"]
  spec.email         = ["hello@danbarber.me"]
  spec.summary       = %q{Do a diff style merge of two arrays}
  spec.description   = %q{Do a diff style merge of two arrays, respecting the order as much as possible.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
