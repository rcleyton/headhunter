require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'Hello World!' do
    visit root_path

    expect(page).to have_content('Encontre o emprego dos seus sonhos aqui')
    expect(page).to have_content('São milhares de empregos nas maiores empresas do país. Aqui, Headhunters encontram os melhores profissionais do mercado.')
  end
end