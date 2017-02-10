require 'rails_helper'

describe "When user visits job show page" do
  scenario "user can edit job specs" do
    company_job = create(:company, :with_jobs)
    company = company_job
    job = company.jobs.first
    updated_title = "Turing"
    updated_city = "Las Vegas"
    updated_desc = "$$$$"
    updated_lot = "15"

    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "job_title", with: updated_title
    fill_in "job_city", with: updated_city
    fill_in "job_description", with: updated_desc
    fill_in "job_level_of_interest", with: updated_lot
    click_on "Update Job"

    expect(page).to have_content updated_title
    expect(page).to have_content updated_city
    expect(page).to have_content updated_desc
    expect(page).to have_content updated_lot
    #expect(page).to_not  have_content job.title
    #expect(page).to_not  have_content job.city
    #expect(page).to_not  have_content job.description
  end
end
    
    
            
    
