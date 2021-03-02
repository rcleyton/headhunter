require 'rails_helper'

feature 'Candidate complete profile' do
  scenario 'successfully' do
    candidate = create(:user)
    profile = create(:candidate_profile)

    login_as candidate, scope: :user
    visit new_candidate_profile_path

    attach_file "default-avatar.jpg", "app/assets/images/default-avatar.jpg"
    fill_in "Nome", with: profile.first_name
    fill_in "Sobrenome", with: profile.lastname
    fill_in "Sobre mim", with: profile.about_me
    fill_in "Data de nascimento", with: profile.birthdate
    fill_in "Educação", with: profile.degree 
    fill_in "Experiência", with: profile.experience 
    click_on "Salvar"
    
    expect(current_path).to eq candidate_profile_path(CandidateProfile.last.id)
    page.find('img')['src'].should have_content 'default-avatar.jpg'
    expect(page).to have_content(profile.first_name)
    expect(page).to have_content(profile.lastname)
    expect(page).to have_content(profile.about_me)
    expect(page).to have_content(profile.birthdate)
    expect(page).to have_content(profile.degree)
    expect(page).to have_content(profile.experience)
  end
end
