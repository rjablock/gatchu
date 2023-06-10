class Public::QuestionsController < Public::ApplicationController

  def new
  end

  def create
  end
  
  ORDER_BY_POPULAR = 'popular'
  ORDER_BY_NEW = 'new'

  def index
    if params[:order] == ORDER_BY_POPULAR
      @order = ORDER_BY_POPULAR
      @questions = Question.all.page(params[:page]).order(views_count: "DESC").per(10)
    else
      @order = ORDER_BY_NEW
      @questions = Question.all.page(params[:page]).order(id: "DESC").per(10)
    end
  end

  def show
    @question = Question.find(params[:id])
    @question.increment_views_count!
  end

end
