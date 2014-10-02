require "test_helper"

feature "Articles::NewArticle" do
  scenario "Creating new Article" do
    sign_in(:one)
    visit new_article_path
    fill_in "Name", with: articles(:one).name
    fill_in "Content", with: articles(:one).content
    click_on "Create Article"
    page.text.must_include articles(:one).name
    page.text.must_include users(:one).email
  end

  scenario "Failing new Article" do
    sign_in(:one)
    visit new_article_path
    fill_in "Content", with: articles(:one).content
    click_on "Create Article"
    page.text.must_include "Guy"
  end

  scenario "Visiting while not logged in" do
    visit new_article_path
    page.text.must_include "Log in"
  end
end
