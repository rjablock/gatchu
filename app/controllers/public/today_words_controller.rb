class Public::TodayWordsController < Public::ApplicationController

  def show
    @today_word = TodayWord.find_by(id: params[:id])

    if @today_word.nil? || !@today_word.is_active
      redirect_to root_path, alert: "単語が見つかりません。"
    else
      @previous_word = TodayWord.where("id < ? AND is_active = ?", @today_word, true).order(id: "DESC").first
      @next_word = TodayWord.where("id > ? AND is_active = ?", @today_word, true).order(:id).first
    end
  end

end
