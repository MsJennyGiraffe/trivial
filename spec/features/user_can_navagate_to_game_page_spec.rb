require "rails_helper"

RSpec.feature "user can navagate to game page" do
  scenario "a user can navagate to the game page" do
    VCR.use_cassette("gamepage") do
      question_one = "How fast did the Millennium Falcon make the Kessel Run?"
      question_two = "What, according to Luke Skywalker was the Emperor's weakness?"
      answer_one = "The Millennium Falcon made the Kessel Run in in less than twelve parsecs."
      answer_two = "According to Luke Skywalker, the Emperor's overconfidence was his weakness."
      visit "/"
      click_link "Let's Play"

      expect(current_path).to eq("/rounds")

      expect(page).to have_content(question_one)
      expect(page).to have_content(answer_one)
      expect(page).to have_content(question_two)
      expect(page).to have_content(answer_two)
    end
  end
  end
