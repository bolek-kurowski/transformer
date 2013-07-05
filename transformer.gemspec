# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transformer/version'

Gem::Specification.new do |spec|
  spec.name          = "transformer"
  spec.version       = Transformer::VERSION
  spec.authors       = ["Bolek Kurowski"]
  spec.email         = ["bolek@alumni.cmu.edu"]
  spec.description   = "Run data transformation with a style"
  spec.summary       = "Organizae, test and run data transformations"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'

end
