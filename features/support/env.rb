require "simplecov"
SimpleCov.command_name "Cucumber"
SimpleCov.coverage_dir "tmp/coverage"
SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter unless ENV["CI"]
SimpleCov.start "rails" do
  add_filter "/app/jobs/application_job.rb"
  add_filter "/app/mailers/application_mailer.rb"
  add_filter "/vendor/"
end

ENV["RAILS_ENV"] ||= "test"

require_relative "../../config/environment"
require "capybara/cucumber"

Capybara.app = Rails.application

Before do
  Todo.delete_all
end
