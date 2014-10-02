require "test_helper"

feature "HomePage" do
  scenario "exists" do
    visit root_path
    page.must_have_content "Wiki"
    page.wont_have_content "Goobye All!"
  end
end
