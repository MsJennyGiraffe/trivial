class Question < ApplicationRecord
  has_one :answer
  has_many :round_questions
  has_many :rounds, through: :round_questions

  def self.make_questions
    round = NerdService.new.get_round
    round.map do |question|
      where(text: question["question"]).first_or_create do |new_question|
        new_question.text = question["question"]
        new_question.answer = Answer.new(text: question["answer"])
      end
    end
  end
end
