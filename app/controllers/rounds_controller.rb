class RoundsController < ApplicationController
  def index
    @questions = Question.make_questions
  end
end
