FactoryGirl.define do

  factory :company do
    name
end

    trait :with_jobs do
      ignore do
        number_of_jobs 1
      end
    after(:create) do |company, evaluator|
      create_list(:job, evaluator.number_of_jobs,company: company)
    end
  end

  factory :job do
    title
    description
    city
    level_of_interest
  end

  sequence :title do |n|
    "#{n} Title"
  end

  sequence :description do |n|
    "#{n} Description"
  end

  sequence :city do |n|
    "#{n} City"
  end

  sequence :level_of_interest do |n|
    "#{n} Level of Interest"
  end

  sequence :name do |n|
    "#{n} Name"
  end
end