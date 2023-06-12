class Public::TodayWordsController < Public::ApplicationController

  def index
    @today_words = TodayWord.where(is_active: true).page(params[:page]).order(id: "DESC").per(10)
  end

  def show
    @today_word = TodayWord.find_by(id: params[:id])

    if @today_word.nil? || !@today_word.is_active
      redirect_to today_words_path, alert: "単語が見つかりません。"
    else
      @previous_word = TodayWord.where("id < ? AND is_active = ?", @today_word, true).order(id: "DESC").first
      @next_word = TodayWord.where("id > ? AND is_active = ?", @today_word, true).order(:id).first
    end
  end

end
