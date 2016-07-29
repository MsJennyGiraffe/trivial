require "rails_helper"

RSpec.feature "user can navagate to game page" do
  scenario "a user can navagate to the game page" do
    VCR.use_cassette("gamepage") do
      visit "/"
      click_link "Let's Play"

      expect(current_path).to eq("/rounds")

      expect(page).to have_content("How fast did the Millennium Falcon make the Kessel Run?")
      expect(page).to have_content("The Millennium Falcon made the Kessel Run in in less than twelve parsecs.")
      expect(page).to have_content("What, according to Luke Skywalker was the Emperor's weakness?")
      expect(page).to have_content("According to Luke Skywalker, the Emperor's overconfidence was his weakness.")
    end
  end
  end
