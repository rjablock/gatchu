class Public::BookmarksController < Public::ApplicationController

  def create
    question = Question.find(params[:question_id])
    bookmark = question.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to request.referer
  end

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).order(id: "DESC").per(10)
  end

  def destroy
    question = Question.find(params[:question_id])
    bookmark = question.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
    redirect_to request.referer
  end

end
