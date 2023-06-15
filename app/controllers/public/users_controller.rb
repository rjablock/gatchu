class Public::UsersController < Public::ApplicationController

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions
    @answered_questions = @user.answers.map(&:question).uniq
    
    @questions_count_past_month = (0..6).map { |months_ago| @user.posted_questions_count_on(months_ago.months.ago) }
    @answers_count_past_month = (0..6).map { |months_ago| @user.answered_questions_count_on(months_ago.months.ago) }
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
