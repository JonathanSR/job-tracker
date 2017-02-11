require 'rails_helper'

describe "User visits category show page" do
  scenario "user views all info for category" do
    category = create(:category, :with_jobs1)
    title = category.title
    #byebug
    job = category.jobs.first.title
    
    visit category_path(category)

    expect(page).to have_content title
    expect(page).to have_content job

    end
  end
