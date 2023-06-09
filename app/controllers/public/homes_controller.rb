class Public::HomesController < Public::ApplicationController

  def top
    @latest_today_word = TodayWord.where(is_active: true).last
    @posts = Post.where(is_active: true).order(id: "DESC").limit(4)
    @genres = Genre.all
    @questions = Question.all.order(id: "DESC").limit(3)
  end

end
