class Question
  def initialize(question, answer)
    @_question = question
    @_answer = answer
  end

  def self.make_questions
    round = NerdService.new.get_round
    round.map do |question|
      Question.new(question["question"], question["answer"])
    end
  end
  
  def question
    @_question
  end

  def answer
    @_answer
  end
end
