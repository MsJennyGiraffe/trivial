require "rails_helper"

describe Question do
  context ".make_questions" do
    it "makes poro questions" do
      VCR.use_cassette("questions") do
        round = Question.make_questions
        expect(round.first.question).to eq("What actor portrayed General Dodonna?")
        expect(round.first.answer).to eq("Alex McCrindle")
        expect(round.last.question).to eq("What large, ancient being is comprised of nothing but a giant head?")
        expect(round.last.answer).to eq("The Face of Bo")
        expect(round.count).to eq(10)
      end
    end
  end
end
