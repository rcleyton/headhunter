require 'rails_helper'

feature 'Validate fields to job register', type: :system do
  scenario "title can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)

    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Título', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Título não pode ficar em branco')
  end

  scenario "detailed description can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
  
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Descrição detalhada', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Descrição detalhada não pode ficar em branco')
  end

  scenario "desired skills can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
    
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Requisitos', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Requisitos não pode ficar em branco')
  end

  scenario "salary can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
  
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Salário', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Salário não pode ficar em branco')
  end

  xscenario "level can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
  
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    select job.vacancy_level, with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Nível não pode ficar em branco')
  end

  scenario "date limit can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
  
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Encerra em', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Encerra em não pode ficar em branco')
  end

  scenario "job location can't be blank" do
    headhunter = create(:user, :headhunter)
    job = create(:job)
  
    login_as headhunter, scope: :user
    visit dashboard_path
    click_on 'Cadastrar Vaga'
    fill_in 'Localização', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content('Localização não pode ficar em branco')
  end
  
end