# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cursetank/version"

Gem::Specification.new do |gem|
  gem.name          = "cursetank"
  gem.version       = Cursetank::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Josh Skeen"]
  gem.email         = ["josh@joshskeen.com"]
  gem.description   = %q{CurseTank - a curses-based ASCII fishtank, for all your fishtank simulation needs!}
  gem.summary       = %q{CurseTank - a curses-based ASCII fishtank, for all your fishtank simulation needs}
  gem.homepage      = "http://github.com/mutexkid/cursetank"

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
