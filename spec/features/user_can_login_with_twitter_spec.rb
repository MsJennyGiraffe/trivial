require 'rails_helper'

RSpec.feature "User can login" do
  scenario "a user with a twitter account can login through twitter oauth" do
    stub_omniauth
    visit "/"
    expect(page).to_not have_content("Welcome")

    click_link ("Sign In with Twitter")

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome")
    expect(page).to have_content("Logout")
  end
end
