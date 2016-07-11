# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'auto_locale/version'

Gem::Specification.new do |s|
  s.name        = 'auto_locale'
  s.version     = AutoLocale::VERSION
  s.authors     = ['Florian Schwab']
  s.email       = ['me@ydkn.de']
  s.homepage    = 'http://github.com/ydkn/auto_locale'
  s.summary     = %q{Automatically set the locale from the browsers HTTP_ACCEPT_LANGUAGE header}
  s.description = %q{Use this gem to automatically set the current locale from the browsers HTTP_ACCEPT_LANGUAGE header}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
