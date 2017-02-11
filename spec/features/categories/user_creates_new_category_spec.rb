require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    title = "Programmer"
    
    visit new_category_path
    fill_in "category_title", with: title
    click_button "Create"
    #visit category_path(category)

    expect(page).to have_content title
    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(Category.count).to eq(1)
  end
end
    

    