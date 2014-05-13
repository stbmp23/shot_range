$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shot_range/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shot_range"
  s.version     = ShotRange::VERSION
  s.authors     = ["masa suzuki"]
  s.email       = ["stbmp23@gmail.com"]
  s.homepage    = ""
  s.summary     = "A Simple Profiler for Rails"
  s.description = "shot_range is a simple profiler for rails application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
