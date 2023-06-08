class Admin::GenresController < Admin::ApplicationController

  def create
    if Genre.count >= 13
      flash[:alert] = "作成可能なジャンルは最大13項目です。"
      redirect_to request.referer
    else
      @genre = Genre.new(genre_params)
      if @genre.save
        flash[:notice] = "ジャンルの作成に成功しました。"
        redirect_to request.referer
      else
        flash[:alert] = "ジャンルの作成に失敗しました。"
        redirect_to request.referer
      end
    end
  end

  def index
    @genres = Genre.all.order(:id)
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
