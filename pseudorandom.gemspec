# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'pseudorandom'
  s.version = '0.1.0.0'

  s.authors = ['Nathan Ladd']
  s.email = 'nathanladd+github@gmail.com'
  s.homepage = 'https://github.com/eventide-core/pseudorandom'
  s.licenses = %w(MIT)
  s.summary = "Pseudorandom number generation"
  s.platform = Gem::Platform::RUBY

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'

  s.add_runtime_dependency 'digest-hash'
end
