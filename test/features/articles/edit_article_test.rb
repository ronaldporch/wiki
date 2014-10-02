require "test_helper"

feature "Articles::EditArticle" do
  scenario "Editing Article" do
    sign_in(:two)
    visit edit_article_path(articles(:one))
    fill_in "Name", with: "Bears"
    fill_in "Content", with: "They are furry"
    click_on "Update Article"
    page.text.must_include "furry"
    page.text.must_include users(:two).email
  end

  scenario "Failing edit Article" do
    sign_in(:one)
    visit edit_article_path(articles(:one))
    fill_in "Content", with: ""
    click_on "Update Article"
    page.text.must_include "Guy"
  end

  scenario "Visiting while not logged in" do
    visit edit_article_path(articles(:one))
    page.text.must_include "Log in"
  end
end
