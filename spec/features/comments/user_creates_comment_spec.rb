require 'rails_helper'

describe "when a user visits a job page" do
  scenario "user adds comment for that job" do
    company = create(:company, :with_jobs)
    company_name = company.name
    job = company.jobs.first
    title = company.jobs.first.title
    content = "Spoke with hiring manager"
    visit company_job_path(company, job)
    
    fill_in "comment_content", with: content
    click_on "Create Comment"

    expect(page).to have_content title
    expect(page).to have_content content
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    #byebug
end
end