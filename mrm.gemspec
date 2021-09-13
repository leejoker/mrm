# frozen_string_literal: true

require_relative "lib/mrm/version"

Gem::Specification.new do |spec|
  spec.name          = "mrm"
  spec.version       = Mrm::VERSION
  spec.authors       = ["leejoker"]
  spec.email         = ["1056650571@qq.com"]

  spec.summary       = "maven repository manager"
  spec.description   = "maven repository manager"
  spec.homepage      = "https://leejoker.github.io"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/leejoker/mrm"
  spec.metadata["changelog_uri"] = "https://github.com/leejoker/mrm"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
