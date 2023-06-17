class Public::BookmarksController < Public::ApplicationController

  def create
    question = Question.find(params[:question_id])
    bookmark = question.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to request.referer, notice: "ブックマークを追加しました。"
  end

  def index
    @bookmarked_questions = current_user.bookmarks.pluck(:question_id)
    @questions = Question.where(id: @bookmarked_questions).page(params[:page]).order(id: "DESC").per(10)
  end

  def destroy
    question = Question.find(params[:question_id])
    bookmark = question.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
    redirect_to request.referer, alert: "ブックマークを削除しました。"
  end

end
