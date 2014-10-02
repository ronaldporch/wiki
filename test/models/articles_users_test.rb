require "test_helper"

class ArticlesUsersTest < ActiveSupport::TestCase

  def articles_users
    @articles_users ||= ArticlesUsers.new
  end

  def test_valid
    assert articles_users.valid?
  end

end
