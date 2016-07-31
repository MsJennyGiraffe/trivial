require "rails_helper"

describe Question do
  context ".make_questions" do
    it "makes poro questions" do
      VCR.use_cassette("questions") do
        round = Question.make_questions
        expect(round.first.question).to eq("What children's toys might Wash be seen playing with?")
        expect(round.first.correct_answer).to eq("Dinosaurs")
        expect(round.first.answers.count).to eq(3)
        expect(round.first.answers.first.class).to eq(String)
        expect(round.last.question).to eq("The Statue of Liberty was given to the United States as a gift from which country?")
        expect(round.last.correct_answer).to eq("France")
        expect(round.last.answers.count).to eq(3)
        expect(round.first.answers.last.class).to eq(String)
        expect(round.count).to eq(10)
      end
    end
  end

  context ".get_answers" do
    it "returns an array of answers" do
      VCR.use_cassette("answers") do
        round = NerdService.new.get_round
        answers = Question.get_answers(round)
        expect(answers.count).to eq(10)
        expect(answers.first).to eq("Abudabi")
        expect(answers.last).to eq("Luke Skywalker lost his right hand in battle with Darth Vader")
      end
    end
  end
end
