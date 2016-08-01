require "rails_helper"

RSpec.feature "user can answer a question" do
  scenario "a user can answer a question" do
    VCR.use_cassette("gamepage") do
      question= "Sheldon and Nermal were characters on what popular kids cartoon?"
      answer = "Garfield and friends"

      visit "/"
      click_link "Let's Play"
      choose :round_questions_correct_answer
      click_button "Update Round"

      expect(page).to have_content("You knew the answer was: #{answer}")
    end
  end
end
