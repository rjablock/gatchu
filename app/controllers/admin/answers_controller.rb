class Admin::AnswersController < Admin::ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.page(params[:page]).per(10)
  end

  def destroy
  end

end
