require 'rails_helper'

describe "When a user visits a job show page" do
  scenario "user can delete that job" do
    company_job = create(:company, :with_jobs, number_of_jobs: 3)
    company  = company_job
    job = company.jobs.first
    
    visit company_job_path(company, job)
    click_on "Delete"

    expect(page).to_not have_content job.title
    expect(page).to_not have_content job.city
    expect(page).to_not have_content job.description
   end
  end