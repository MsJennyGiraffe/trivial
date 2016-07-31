class Question
  def initialize(question, answer, answers)
    @_question = question
    @_correct_answer = answer
    @_answers = answers
  end

  def self.make_questions
    round = NerdService.new.get_round
    answers = get_answers(round)
    round.map do |question|
      Question.new(question["question"], question["answer"], answers.sample(3))
    end
  end

  def self.get_answers(round)
    round.map { |question| question["answer"] }
  end

  def question
    @_question
  end

  def correct_answer
    @_correct_answer
  end

  def answers
    @_answers
  end
end
