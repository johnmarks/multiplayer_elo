# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multiplayer_elo/version'

Gem::Specification.new do |spec|
  spec.name          = "multiplayer_elo"
  spec.version       = MultiplayerElo::VERSION
  spec.authors       = ["John Marks"]
  spec.email         = ["john@bluefroggaming.com"]
  spec.summary       = %q{Elo library for single and multiplayer games}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "activerecord"
end
