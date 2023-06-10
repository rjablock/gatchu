class Public::QuestionsController < Public::ApplicationController

  def new
  end

  def create
  end

  def index
    if params[:order] == "popular"
      @order = "popular"
      @questions = Question.all.page(params[:page]).order(views_count: "DESC").per(10)
    else
      @order = "new"
      @questions = Question.all.page(params[:page]).order(id: "DESC").per(10)
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.increment_views_count!
  end

end
