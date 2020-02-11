require 'simplecov'
SimpleCov.start 'rails'
if ENV['CI']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  Dir.glob(Rails.root.join('test', 'support', '*.rb')).each do |filename|
    require filename
    if filename.end_with?('_support.rb')
      include File.basename(filename).split('.').first.camelize.constantize
    end
  end
end
