# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strockets/version"

Gem::Specification.new do |s|
  s.name        = "strockets"
  s.version     = Strockets::VERSION
  s.authors     = ["Sebastian Gamboa"]
  s.email       = ["me@sagmor.com"]
  s.homepage    = "https://github.com/sagmor/strockets"
  s.summary     = %q{Make Stitch and Sprockets friends}
  s.description = %q{Use Stitch allong with Sprockets}

  s.rubyforge_project = "strockets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "sprockets"
  # s.add_runtime_dependency "stitch"
end
