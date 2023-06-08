class Public::TodayWordsController < Public::ApplicationController

  def index
    @today_words = TodayWord.all.page(params[:page]).order(id: "DESC").per(10)
  end

  def show
    @today_word = TodayWord.find(params[:id])
    @previous_word = TodayWord.where("id < ?", @today_word).order(id: "DESC").first
    @next_word = TodayWord.where("id > ?", @today_word).order(:id).first
  end

end
