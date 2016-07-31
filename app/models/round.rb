class Round < ApplicationRecord
  has_many :round_questions
  has_many :questions, through: :round_questions

  def self.set_round
    round = Round.new
    questions = Question.make_questions
    round.questions = questions
    round.save
    round
  end
end
