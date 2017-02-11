require 'rails_helper'

describe "user edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    updated_title = "server"

    visit edit_category_path(category)
    fill_in "category_title", with: updated_title
    click_button "Update"

    expect(page).to have_content updated_title
    expect(page).to_not have_content category.title
  end
end