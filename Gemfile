source ENV['GEM_SOURCE'] || 'https://rubygems.org'

def location_for(place, version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [version, { :git => $1, :branch => $2, :require => false}].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false}]
  else
    [place, version, { :require => false}].compact
  end
end

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['~> 4.6']
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint', '>= 2.0.0'
gem 'facter', '>= 1.7.0'
gem 'metadata-json-lint', '>= 0.0.11'
gem 'ci_reporter_rspec', '>= 1.0.0'
gem 'simplecov'
gem 'simplecov-json'
gem 'simplecov-rcov'
gem 'beaker-rspec',                  *location_for(ENV['BEAKER_RSPEC_VERSION'] || '>= 3.4')
gem 'beaker',                        *location_for(ENV['BEAKER_VERSION'])
gem 'serverspec'
gem 'beaker-puppet_install_helper'
gem 'master_manipulator'
gem 'beaker-hostgenerator',          *location_for(ENV['BEAKER_HOSTGENERATOR_VERSION'])
gem 'safe_yaml', '~> 1.0.4'
