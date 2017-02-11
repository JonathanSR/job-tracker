require 'rails_helper'

describe "when a user visits the index page" do
  scenario "user sees all categories" do
    category1 = create(:category)
    category2 = create(:category)
    title = category1.title
    title2 = category2.title

    visit categories_path
    expect(page).to have_content title
    expect(page).to have_content title2    
    expect(page).to have_link("Delete", href: category_path(category1))
    expect(page).to have_link("Delete", href: category_path(category2))
    expect(page).to have_link("Edit", href: edit_category_path(category1))
    expect(page).to have_link("Edit", href: edit_category_path(category2))
    
    end
  end





