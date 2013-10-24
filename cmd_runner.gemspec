# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cmd_runner/version'

Gem::Specification.new do |spec|
  spec.name          = "cmd_runner"
  spec.version       = CmdRunner::VERSION
  spec.authors       = ["Denis Yagofarov"]
  spec.email         = ["denyago@gmail.com"]
  spec.description   = %q{Simple helper to run commands}
  spec.summary       = %q{Simple helper to run commands}
  spec.homepage      = 'https://github.com/denyago/cmd_runner'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-debugger"
end
