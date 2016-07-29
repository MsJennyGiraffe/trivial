class RoundsController < ApplicationController
  def index
    @round = Question.make_questions
  end
end
