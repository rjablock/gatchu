class Public::QuestionsController < Public::ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
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
    @question = Question.find_by(id: params[:id])

    if @question.nil?
      redirect_to questions_path, alert: "質問が見つかりません。"
    else
      @question.increment_views_count!
      @answer = Answer.new

      @previous_question = Question.where("id < ?", @question).order(id: "DESC").first
      @next_question = Question.where("id > ?", @question).order(:id).first
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
