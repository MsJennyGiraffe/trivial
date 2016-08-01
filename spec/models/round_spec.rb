require "rails_helper"

describe Round do
  context ".set_round" do
    it "sets a round id through round questions" do
      VCR.use_cassette("round") do
        round = Round.set_round
        expect(round.questions.first.text).to eq("What is the name of the massive weapon derived from alien technology built to defend the earth from potential alien attack?")
        expect(round.questions.last.text).to eq("What did hibernation sickness do to Han Solo?")
        expect(round.questions.count).to eq(10)
      end
    end
  end
end
