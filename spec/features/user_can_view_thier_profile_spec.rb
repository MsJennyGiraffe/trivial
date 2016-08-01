require 'rails_helper'

RSpec.feature "A user can view their profile" do
  scenario "A user is logged in" do
    stub_omniauth
    visit("/")
    click_link("Sign In with Twitter")
    click_link("Profile")

    expect(page).to have_content("Jenny")
    expect(page).to have_content("MsJennyGiraffe")
    expect(page).to have_content("Score")
  end
end
