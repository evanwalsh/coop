# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coop/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Evan Walsh"]
  gem.email         = ["evan@nothingconcept.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "coop"
  gem.require_paths = ["lib"]
  gem.version       = Coop::VERSION
  
  gem.required_ruby_version = '>= 1.9.2'
  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 2.11.3"
  gem.add_development_dependency "guard-minitest", "~> 0.5.0"
  gem.add_development_dependency "turn", "~> 0.9.3"
  
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem.add_development_dependency "growl", "~> 1.0.3"
  end
end
