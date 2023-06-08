class Admin::GenresController < Admin::ApplicationController

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの作成に成功しました。"
      redirect_to request.referer
    else
      flash[:alert] = "ジャンルの作成に失敗しました。"
      @genres = Genre.all
      redirect_to request.referer
    end
  end

  def index
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
