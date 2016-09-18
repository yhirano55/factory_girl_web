$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "factory_girl_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "factory_girl_web"
  s.version     = FactoryGirlWeb::VERSION
  s.authors     = ["Yoshiyuki Hirano"]
  s.email       = ["yhirano@me.com"]
  s.homepage    = "https://github.com/yhirano55/factory_girl_web"
  s.description = "A web interface for factory_girl"
  s.summary     = s.description
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2"
  s.add_dependency "slim"

  s.add_development_dependency "factory_girl_rails"
end
