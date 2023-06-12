class Admin::QuestionsController < Admin::ApplicationController

  def index
    @questions = Question.all.page(params[:page]).per(10)
  end

  def destroy
  end

end
