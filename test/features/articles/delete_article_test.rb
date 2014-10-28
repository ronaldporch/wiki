require 'test_helper'

feature 'Articles::DeleteArticle' do
  scenario 'Deleting Article' do
    sign_in(:two)
    visit article_path(articles(:one))
    click_on 'Delete'
    page.text.wont_include articles(:one).name
  end

  scenario 'Visiting while not logged in' do
    visit article_path(articles(:one))
    page.text.wont_include 'Delete'
  end
end
