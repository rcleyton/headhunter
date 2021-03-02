FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    detailed_description { "Desenvolver novas features no sistema" }
    desired_skills { "Ruby, Rails, Postgres, Docker, Sidqik e redis" }
    salary_range { "R$#{Faker::Number.decimal(l_digits: 2)}" }
    vacancy_level { "Senior" }
    limit_date { "2021-02-27" }
    job_location { "Av. Brigadeiro Faria" }
  end
end
