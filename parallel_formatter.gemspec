# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parallel_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "parallel_formatter"
  spec.version       = ParallelFormatter::VERSION
  spec.authors       = ["Caleb Guanzon"]
  spec.email         = ["calebguanzon@gmail.com"]
  spec.summary       = %q{Another RSpec custom formatter.}
  spec.description   = %q{An RSpec custom formatter that works nicely with parallel_tests.}
  spec.homepage      = "https://github.com/cguanzon/parallel_formatter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec", ">= 3.4.0"
  spec.add_development_dependency "bundler", ">= 1.11.2"
  spec.add_development_dependency "rake", ">= 10.0"
end
