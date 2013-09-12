# Fix until Spork gets updates.
module ActiveModel; module Observing; end; end;

require 'spork'

if ENV['COVERAGE']
	require 'simplecov'
	SimpleCov.start 'rails'
	puts "Runnning with test coverage."
end

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'factory_girl_rails'
  require 'capybara/rails'
  require 'capybara/rspec'
  # require 'capybara/poltergeist'

  require 'carrierwave/test/matchers'
  require 'webmock/rspec'

  # Capybara.javascript_driver = :poltergeist
  # Capybara.register_driver :poltergeist do |app|
  #   Capybara::Poltergeist::Driver.new(app, {
  #     window_size: [1024, 768]
  #   })
  # end

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include ActionView::RecordIdentifier

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.filter_run_excluding(js: true) if ENV['IGNORE_JS'] == 'true'
    config.filter_run_excluding(no_ci: true) if ENV['CIRCLECI'] == 'true'
    config.filter_run_including(focus: true) unless (ENV['CI'] == 'true') || (ENV['CIRCLECI'] == 'true')

    config.run_all_when_everything_filtered = true
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each, js: true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.after(:each, js: true) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before :each do
      DatabaseCleaner.start
    end

    config.after :each do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  FactoryGirl.reload
end
