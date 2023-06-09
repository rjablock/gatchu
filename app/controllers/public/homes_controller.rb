class Public::HomesController < Public::ApplicationController

  def top
    @posts = Post.where(is_active: true).page(params[:page]).order(id: "DESC").per(4)
    @genres = Genre.all
    @questions = Question.all.order(id: "DESC").limit(3)
  end

end
