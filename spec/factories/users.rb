FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com" }
    password { '000000' }
    role { :candidate }

    trait :headhunter do
      role { :headhunter }
    end
  end
end