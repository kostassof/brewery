$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brewery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brewery"
  s.version     = Brewery::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Brewery."
  s.description = "TODO: Description of Brewery."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # s.add_dependency "rails", "~> 4.0.0.beta"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails_best_practices"
end