require 'rails_helper'

feature 'Candidate complete profile' do
  scenario 'successfully' do
    candidate = create(:user)
    profile = create(:candidate_profile)

    login_as candidate, scope: :user
    visit new_candidate_profile_path

    attach_file "Photo", "app/assets/images/default-avatar.jpg"
    fill_in "First name", with: profile.first_name
    fill_in "Lastname", with: profile.lastname
    fill_in "About me", with: profile.about_me
    fill_in "Birthdate", with: profile.birthdate
    fill_in "Degree", with: profile.degree 
    fill_in "Experience", with: profile.experience 
    click_on "Criar Candidate profile"
    
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
