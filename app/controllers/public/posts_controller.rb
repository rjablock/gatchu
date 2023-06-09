class Public::PostsController < Public::ApplicationController

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = Post.where(genre_id: params[:genre_id], is_active: true).page(params[:page]).order(id: "DESC").limit(8)
    else
      @posts = Post.where(is_active: true).page(params[:page]).order(id: "DESC").limit(8)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @previous_post = Post.where("id < ? AND is_active = ?", @post, true).order(id: "DESC").first
    @next_post = Post.where("id > ? AND is_active = ?", @post, true).order(:id).first

    if @post.nil? || !@post.is_active
      redirect_to posts_path, alert: "単語が見つかりません。"
    end
  end

end
