class Admin::QuestionsController < Admin::ApplicationController

  def index
    @questions = Question.all.page(params[:page]).per(10)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path
  end

end
