class Public::AnswersController < Public::ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = Answer.new(answer_params)
    answer.user_id = current_user.id
    answer.question_id = question.id
    if question.user == current_user
      redirect_to request.referer
      flash[:alert] = "自身の質問には回答できません。"
    elsif answer.save
      redirect_to question_path(question)
    else
      @question = question
      @answer = answer
      render 'public/questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
