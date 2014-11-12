# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'urban_dict/version'

Gem::Specification.new do |spec|
  spec.name          = "urban_dict"
  spec.version       = UrbanDict::VERSION
  spec.authors       = ["Miles Matthias"]
  spec.email         = ["miles.matthias@gmail.com"]
  spec.description   = %q{A Ruby client for the UrbanDictionary.com JSON API.}
  spec.summary       = %q{A Ruby client for the UrbanDictionary.com JSON API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
