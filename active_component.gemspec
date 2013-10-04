$:.push File.expand_path("../lib", __FILE__)

require "active_component/version"

Gem::Specification.new do |s|
  s.name        = "active-component"
  s.version     = ActiveComponent::VERSION
  s.authors     = ["Antonio Chavez", "Jesus Romero"]
  s.email       = ["cavjzz@gmail.com", "elherzt@gmail.com"]
  s.homepage    = "https://github.com/TheNaoX/active_component"
  s.summary     = "A View-Component framework for Rails applications."
  s.description = "A View-Component framework for Rails applications."
  s.licenses    = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "mustache"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "faker"
  s.add_development_dependency "pry"
end
