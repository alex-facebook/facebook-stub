# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

$: << File.expand_path('../../lib', __FILE__)

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

require 'ruby-debug'
require File.expand_path('../../test/server', __FILE__)

Capybara.configure do |config|

  config.register_driver :selenium_firefox do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :resynchronization_timeout => 20)
  end

  config.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :resynchronization_timeout => 20)
  end

  config.app = TestServer
  config.run_server = true
  # config.server {|app, port| Capybara.run_default_server(app, port) }
  config.default_driver         = :selenium_chrome
  config.javascript_driver      = :selenium_chrome
  config.default_selector       = :css
  config.ignore_hidden_elements = true
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Capybara::DSL
end
