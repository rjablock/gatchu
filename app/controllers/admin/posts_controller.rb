class Admin::PostsController < Admin::ApplicationController

  def new
    @post = Post.new
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "記事の作成に成功しました。"
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    @posts = Post.all.page(params[:page]).order(id: "DESC").per(10)
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    @genre = Genre.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "記事の更新に成功しました。"
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "記事の削除に成功しました。"
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :body, :is_active, :image)
  end

end
