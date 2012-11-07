require 'date'

Gem::Specification.new do |s|
  s.name                      = 'flex-rails'
  s.summary                   = 'Rails integration for Flex'
  s.description               = 'Provides the engine and generators to integrate Flex with Rails'
  s.homepage                  = 'http://github.com/ddnexus/flex-rails'
  s.authors                   = ["Domizio Demichelis"]
  s.email                     = 'dd.nexus@gmail.com'
  s.extra_rdoc_files          = %w[README.md]
  s.files                     = `git ls-files -z`.split("\0")
  s.version                   = File.read(File.expand_path('../VERSION', __FILE__)).strip
  s.date                      = Date.today.to_s
  s.required_rubygems_version = ">= 1.3.6"
  s.rdoc_options              = %w[--charset=UTF-8]

  s.add_runtime_dependency 'flex', '>= 0.5.0'
  s.add_runtime_dependency 'prompter', '~> 0.1.5'
end
