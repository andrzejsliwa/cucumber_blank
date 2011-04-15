require 'rubygems'
require 'cucumber'
require 'capybara/cucumber'
require 'json'

# Setup capybara for using right driver
Capybara.default_driver = :selenium # or :culerity

# This maps to host for testing, but can be also set via step:
#   Given I am on "http://www.google.pl"
#

Capybara.app_host = "http://www.google.pl"
Capybara.default_selector = :css

# Extend Cucumber World with minitest assertions
World(MiniTest::Assertions)

Before do
end

After do
end
