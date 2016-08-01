class RoundsController < ApplicationController
  def index
  end

  def new
    @round = Round.set_round
    redirect_to round_path(@round)
  end

  def show
    @wrong_answers = Answer.all.sample(3)
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    @verdict = params["round"]["questions"]
    @round.correct += 1 if @verdict == "correct answer"
  end
end
