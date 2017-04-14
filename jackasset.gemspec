# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'jackasset/version'

Gem::Specification.new do |s|
  s.name = 'jackasset'
  s.version = Jackasset::VERSION
  s.summary = 'Check asset sources in HTML files'
  s.description = 'A Ruby CLI for checking local static site assets.'
  s.authors = ['Kevin McCormack']
  s.email = 'HarlemSquirrel@gmail.com'
  s.files = Dir['bin/*'] + Dir['config/*.rb'] + Dir['lib/**/*'] + Dir['README.md']
  s.homepage    = 'https://github.com/HarlemSquirrel/jackasset'
  s.license     = 'MIT'
  s.executables << 'jackasset'

  s.required_ruby_version = '>= 2.4.0'
  s.add_runtime_dependency 'colorize', '~> 0.8'
end
