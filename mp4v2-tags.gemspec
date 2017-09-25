# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mp4v2/tags/version'

Gem::Specification.new do |spec|
  spec.name          = 'mp4v2-tags'
  spec.version       = Mp4v2::Tags::VERSION
  spec.authors       = ['cyrill']
  spec.email         = ['siril.taka@gmail.com']
  spec.summary       = %q{libmp4v2 binding for ruby}
  spec.description   = %q{libmp4v2 binding for ruby using ffi}
  spec.homepage      = 'https://github.com/t-cyrill/mp4v2-tags'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ffi', '~> 1.9'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
