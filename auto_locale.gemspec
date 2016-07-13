# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'auto_locale/version'

Gem::Specification.new do |spec|
  spec.name        = 'auto_locale'
  spec.version     = AutoLocale::VERSION
  spec.authors     = ['Florian Schwab']
  spec.email       = ['me@ydkn.de']
  spec.homepage    = 'http://github.com/ydkn/auto_locale'
  spec.summary     = %q{Automatically set the locale from the browsers HTTP_ACCEPT_LANGUAGE header}
  spec.description = %q{Use this gem to automatically set the current locale from the browsers HTTP_ACCEPT_LANGUAGE header}

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
