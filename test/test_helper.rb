ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(n)
        visit new_user_session_path
    fill_in "Email", with: users(n).email
    fill_in "Password", with: "password"
    click_on "Log in"
    page.text.must_include "Sign Out"
  end
end
