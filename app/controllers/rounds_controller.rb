class RoundsController < ApplicationController
  def index
    @questions = Question.make_questions
  end

  def show
    @wrong_answers = Answer.all.sample(3)
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.set_round
    redirect_to round_path(@round)
  end
end
