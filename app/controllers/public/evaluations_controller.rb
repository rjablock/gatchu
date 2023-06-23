class Public::EvaluationsController < Public::ApplicationController
  before_action :ensure_guest_user, only: [:create, :destroy]

  def create
    @answer = Answer.find(params[:answer_id])
    @evaluation = @answer.evaluations.new(user_id: current_user.id)
    if @answer.user == current_user
      flash[:alert] = "自分の回答に評価をつけることはできません。"
      redirect_to request.referer
    else
      @evaluation.save
    end
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @evaluation = @answer.evaluations.find_by(user_id: current_user.id)
    @evaluation.destroy
  end
  
  private
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to request.referer, alert: "ゲストユーザーはこの操作を行えません。"
    end
  end

end
