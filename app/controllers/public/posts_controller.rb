class Public::PostsController < Public::ApplicationController

  def index
    if params[:genre_id]
      @genre = Genre.find_by(id: params[:genre_id])
      if @genre.nil?
        redirect_to root_path, alert: "ジャンルが見つかりません。"
      else
        @posts = Post.where(genre_id: params[:genre_id], is_active: true).page(params[:page]).order(id: "DESC").limit(8)
      end
    else
      @posts = Post.where(is_active: true).page(params[:page]).order(id: "DESC").limit(8)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])

    if @post.nil? || !@post.is_active
      redirect_to posts_path, alert: "記事が見つかりません。"
    else
      @previous_post = Post.where("id < ? AND is_active = ?", @post, true).order(id: "DESC").first
      @next_post = Post.where("id > ? AND is_active = ?", @post, true).order(:id).first
    end
  end

end
