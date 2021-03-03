require 'rails_helper'

feature 'Headhunter edit a job', type: :system do
  scenario 'successfully' do
    headhunter = create(:user, :headhunter)
    job = create(:job)

    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Vagas'
    click_on 'Conferir'
    click_on "Editar Vaga"

    fill_in 'Título', with: 'DevOps'
    fill_in 'Descrição detalhada', with: 'Auxiliar time de desenvovimento e operação'
    fill_in 'Requisitos', with: 'Git, cloud, integração contínua, testes automatizados'
    fill_in 'Salário', with: 'R$ 3.500,00'
    select 'Júnior', from: 'Nível'
    fill_in 'Encerra em', with: 10.days.from_now
    fill_in 'Localização', with: 'Santo Amaro'
    click_on 'Salvar'

    expect(page).not_to have_content(job.title)
    expect(page).not_to have_content(job.detailed_description)
    expect(page).not_to have_content(job.desired_skills)
    expect(page).not_to have_content(job.salary_range)
    expect(page).not_to have_content(job.vacancy_level)
    expect(page).not_to have_content(I18n.l(job.limit_date, format: :long))
    expect(page).not_to have_content(job.job_location)
    expect(page).not_to have_content('Vaga atualizada com sucesso')
  end
end

