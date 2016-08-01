require "rails_helper"

describe Question do
  context ".make_questions" do
    it "makes question in database if it doesn't already exist" do
      VCR.use_cassette("questions") do
        round = Question.make_questions
        expect(round.first.text).to eq("Who were the only married couple to travel on the Tardis?")
        expect(round.first.answer.text).to eq("Rory and Amy Williams, not Pond")
        expect(round.last.text).to eq("Anora had what scandalous profession?")
        expect(round.last.answer.text).to eq("Companion")
        expect(round.count).to eq(10)
        expect(Question.all.count).to eq(10)
        expect(Answer.all.count).to eq(10)
      end
    end
  end
end
