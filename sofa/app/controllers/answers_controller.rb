class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_question, only: [:create]
  before_action :set_answer, only: [:show, :destroy]
  
  def create
    @answer = @question.answers.new(answers_params)
    @answer.save

    render :show
  end

  def destroy
    @answer.destroy
    redirect_to question_path
  end

  def show
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answers_params
    params.required(:answer).permit(:body)
  end
end
