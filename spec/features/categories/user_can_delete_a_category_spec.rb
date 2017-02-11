require 'rails_helper'

describe "user can delete a category" do
      scenario "user deletes a category" do
        category3 = create(:category)
        visit categories_path
        expect(page).to have_content category3.title
      
        click_link "Delete"
      expect(page).to_not have_content category3.title
      end
    end