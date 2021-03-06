require 'spec_helper'


ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?


require 'rspec/rails'
require 'rails-controller-testing'

Rails::Controller::Testing.install

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include FeatureHelpers, type: :feature
  config.include ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :controller

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 5
ActionDispatch::IntegrationTest
Capybara.server_port = 3001
Capybara.app_host = 'http://localhost:3001'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
