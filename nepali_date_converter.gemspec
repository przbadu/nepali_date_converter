# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nepali_date_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "nepali_date_converter"
  spec.version       = NepaliDateConverter::VERSION
  spec.authors       = ["Pushpa Raj Badu"]
  spec.email         = ["pushparaj.badu@gmail.com"]

  spec.summary       = %q{Ruby library to convert AD to BS and vice versa}
  spec.description   = %q{Ruby library to convert AD to BS and convert BS to AD}
  spec.homepage      = "https://github.com/przbadu/nepali_date_converter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3.5"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", '~> 0.10.4'
end
