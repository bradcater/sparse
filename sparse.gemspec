# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sparse/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Brad Cater']
  gem.email         = ['bradcater@gmail.com']
  gem.description   = %q{Provides a compact representation of sparse data structures}
  gem.summary       = %q{Provides a compact representation of sparse data structures. Only SpArray, the sparse Array, is implemented. By storing the sparse value, the size, and the (index, value) pairs that are not the sparse value, Sparse classes avoid storing redundant data.}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'sparse'
  gem.require_paths = ['lib']
  gem.version       = Sparse::VERSION

  gem.add_development_dependency 'rake', '~> 0.9.2'
  gem.add_development_dependency 'rspec', '~> 2.11'
end
