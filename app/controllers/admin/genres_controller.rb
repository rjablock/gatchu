class Admin::GenresController < Admin::ApplicationController

  def create
    if Genre.count >= 10
      flash[:alert] = "作成可能なジャンルは最大10項目です。"
      redirect_to request.referer
    else
      genre = Genre.new(genre_params)
      if genre.save
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
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      flash[:notice] = "ジャンル名の更新に成功しました。"
      redirect_to request.referer
    else
      flash[:alert] = "ジャンル名の更新に失敗しました。"
      redirect_to request.referer
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path, notice: "ジャンルの削除に成功しました。"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
