class Admin::QuestionsController < Admin::ApplicationController

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.page(params[:page]).per(10)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path, notice: "質問の削除に成功しました。"
  end

end
