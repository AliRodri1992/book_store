ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'support/factory_bot'

# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # This block takes a snapshot of the page you are testing.
  # See capybara docs for more on this.
  # The snapshots are saved by default in tmp/capybara.
  config.after do |example|
    if example.metadata[:type] == :feature
      # save_and_open_page
      save_and_open_screenshot
    end
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  # Uncomment to use capybara-webkit driver for headless testing
  # Capybara.javascript_driver = :webkit
  # Capybara.run_server = false
  # Capybara.app_host = "https://my-website.mysite.com"
  Capybara.configure do |config|
    config.default_max_wait_time = 10 #seconds
    config.default_driver = :selenium
    # config.always_include_port = true
  end
end
