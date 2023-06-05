class Public::HomesController < Public::ApplicationController

  def top
    @posts = Post.where(is_active: true).order(id: "DESC").limit(4)
  end

end
