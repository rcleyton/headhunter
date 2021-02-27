FactoryBot.define do
  factory :candidate_profile do
    user_id { 1 }
    first_name { "Cleyton" }
    lastname { "Silva" }
    about_me { "Desenvolvedor de Software" }
    birthdate { "19811-09-11" }
    degree { "Ensino Suoerior" }
    experience { "Desenvolvimento Web" }
  end
end
