class Public::UsersController < Public::ApplicationController
  before_action :ensure_guest_user, only: [:edit, :update, :confirm, :quit]

  def show
    @user = User.find(params[:id])
    if @user.is_deleted
      redirect_to user_path(current_user), alert: "ユーザーが見つかりません。"
    else
      @posted_questions = @user.questions
      @answered_questions = @user.answers.map(&:question).uniq

      @questions_count_past_month = (0..6).map { |months_ago| @user.posted_questions_count_on(months_ago.months.ago) }
      @answers_count_past_month = (0..6).map { |months_ago| @user.answered_questions_count_on(months_ago.months.ago) }
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

  def confirm
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def quit
    user = User.find(params[:id])
    if user == current_user
      user.update(is_deleted: true)
      reset_session
      redirect_to root_path, notice: "退会手続きが完了しました。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :gender, :age, :study_background, :living_area, :email)
  end

  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user), alert: "ゲストユーザーはこの操作を行えません。"
    end
  end

end
