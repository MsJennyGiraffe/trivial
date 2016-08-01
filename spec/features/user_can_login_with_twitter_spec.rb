require 'rails_helper'

RSpec.feature "User can login" do
  scenario "a user with a twitter account can login through twitter oauth" do
    stub_omniauth
    visit "/"
    expect(page).to_not have_content("Welcome")

    click_link ("Sign In with Twitter")

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Jenny")
    expect(page).to have_content("Logout")
  end

  scenario "a logged in user can logout" do
    stub_omniauth
    visit "/"

    click_link("Sign In with Twitter")

    expect(page).to have_content("Welcome Jenny")

    click_link("Logout")

    expect(page).to have_content("Sign In with Twitter")
    expect(page).to_not have_content("Welcome, Jenny")
  end
end
