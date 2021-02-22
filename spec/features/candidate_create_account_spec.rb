require 'rails_helper'

feature 'Candidate create a new account' do
  scenario 'successfully' do
    visit root_path
    click_on 'Registrar'
    fill_in 'Email', with: 'candidate@candidate.com.br'
    fill_in 'Senha com mínimo 6 caracteres', with: '123456'
    fill_in 'Repita a senha', with: '123456'
    select 'candidato', from: 'Cadastrar como'
    click_on 'Cadastrar'
    
    expect(page).to have_content('Login efetuado com sucesso.')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
  end

  scenario 'and validate all fields' do
    candidate = create(:user)

    visit root_path
    click_on 'Registrar'
    fill_in 'Email', with: ''
    fill_in 'Senha com mínimo 6 caracteres', with: ''
    fill_in 'Repita a senha', with: ''
    select 'candidato', from: 'Cadastrar como'
    click_on 'Cadastrar'

    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
  end

  scenario 'and log out' do
    candidate = create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: candidate.email
    fill_in 'Senha', with: candidate.password
    within '.button' do
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso.')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
    expect(current_path).to eq(root_path)
  end
end