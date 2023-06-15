class Public::UsersController < Public::ApplicationController

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions
    @answered_questions = @user.answers.map(&:question).uniq
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def quit
  end

end
