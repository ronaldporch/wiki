require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def article
    @article ||= Article.new
  end

  def test_valid
    assert article.valid?
  end

end
