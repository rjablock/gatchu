class Public::EvaluationsController < Public::ApplicationController

  def create
    answer = Answer.find(params[:answer_id])
    evaluation = answer.evaluations.new(user_id: current_user.id)
    if answer.user == current_user
      flash[:alert] = "自分の回答に評価をつけることはできません。"
      redirect_to request.referer
    else evaluation.save
      redirect_to request.referer
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    evaluation = answer.evaluations.find_by(user_id: current_user.id)
    evaluation.destroy
    redirect_to request.referer
  end

end
