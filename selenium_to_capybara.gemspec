lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "selenium_to_capybara/version"

Gem::Specification.new do |spec|
  spec.name          = "selenium_to_capybara"
  spec.version       = SeleniumToCapybara::VERSION
  spec.authors       = ["Benjamin Behr"]
  spec.email         = ["benny@digitalbehr.de"]

  spec.summary       = %q{Translates selenium tests to capybara.}
  spec.homepage      = "https://github.com/DarkSwoop/selenium_to_capybara"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
