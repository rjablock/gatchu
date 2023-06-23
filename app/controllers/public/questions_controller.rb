class Public::QuestionsController < Public::ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :ensure_guest_user, only: [:new, :create]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question), notice: "質問の投稿に成功しました。"
    else
      render :new
    end
  end

  ORDER_BY_POPULAR = 'popular'
  ORDER_BY_NEW = 'new'

  def index
    if params[:order] == ORDER_BY_POPULAR
      @order = ORDER_BY_POPULAR
      @questions = Question.all.left_joins(:bookmarks).group('questions.id').page(params[:page]).order('views_count DESC', 'COUNT(bookmarks.id) DESC').per(10)
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

  def search
      @questions = @q.result.page(params[:page]).order(id: "DESC").per(10)
      @search_word = params[:q][:title_cont]
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_q
    @q = Question.ransack(params[:q])
  end

  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to questions_path, alert: "ゲストユーザーはこの操作を行えません。"
    end
  end

end
