class Admin::AnswersController < Admin::ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.page(params[:page]).per(10)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to admin_question_answers_path
  end

end
