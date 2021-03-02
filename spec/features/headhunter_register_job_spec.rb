require 'rails_helper'

feature 'Headhunter register a job' do
  scenario 'successfully' do
    headhunter = create(:user, :headhunter)
    job = create(:job, salary_range: "R$ 5.000,00")

    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Título', with: job.title
    fill_in 'Descrição detalhada', with: job.detailed_description
    fill_in 'Requisitos', with: job.desired_skills 
    fill_in 'Salário', with: job.salary_range
    select job.vacancy_level, from: 'Nível'
    fill_in 'Encerra em', with: job.limit_date
    fill_in 'Localização', with: job.job_location
    click_on 'Salvar'

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.detailed_description)
    expect(page).to have_content(job.desired_skills)
    expect(page).to have_content(job.salary_range)
    expect(page).to have_content('Júnior')
    expect(page).to have_content(I18n.l(job.limit_date, format: :long))
    expect(page).to have_content(job.job_location)
  end
end