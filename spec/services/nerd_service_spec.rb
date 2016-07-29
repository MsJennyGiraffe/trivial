require 'rails_helper'

describe NerdService do
  context("#get_round") do
    it "returns a 10 question round of trivia" do
      VCR.use_cassette("round") do
        round = NerdService.new.get_round
        expect(round.count).to eq(10)
        expect(round.first["answer"]).to eq("Torchwood")
        expect(round.first["question"]).to eq("What is the name of the massive weapon derived from alien technology built to defend the earth from potential alien attack?")
        expect(round.last["answer"]).to eq("Hibernation sickness caused Han Solo temporary blindness.")
        expect(round.last["question"]).to eq("What did hibernation sickness do to Han Solo?")
      end
    end
  end
end
