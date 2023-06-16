class Public::UsersController < Public::ApplicationController

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions
    @answered_questions = @user.answers.map(&:question).uniq

    @questions_count_past_month = (0..6).map { |months_ago| @user.posted_questions_count_on(months_ago.months.ago) }
    @answers_count_past_month = (0..6).map { |months_ago| @user.answered_questions_count_on(months_ago.months.ago) }
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def confirm
    @user = User.find(params[:id])
  end

  def quit
    user = current_user
    user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会手続きが完了しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :gender, :age, :study_background, :living_area, :email)
  end

end
