class Admin::TodayWordsController < Admin::ApplicationController

  def new
    @today_word = TodayWord.new
  end

  def create
    @today_word = TodayWord.new(today_word_params)
    if @today_word.save
      redirect_to admin_today_words_path
    else
      render :new
    end
  end

  def index
    @today_words = TodayWord.all.page(params[:page]).order(id: "DESC").per(10)
  end

  def edit
    @today_word = TodayWord.find(params[:id])
  end

  def update
    @today_word = TodayWord.find(params[:id])
    if @today_word.update(today_word_params)
      redirect_to admin_today_words_path
    else
      render :edit
    end
  end

  def destroy
    @today_word = TodayWord.find(params[:id])
    @today_word.destroy
    redirect_to admin_today_words_path
  end

  private

  def today_word_params
    params.require(:today_word).permit(:japanese, :chinese, :pinyin, :example_japanese, :example_chinese, :description, :synonym, :is_active)
  end

end
