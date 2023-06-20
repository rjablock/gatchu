class Public::AnswersController < Public::ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = Answer.new(answer_params)
    answer.user_id = current_user.id
    answer.question_id = question.id
    if answer.save
      redirect_to question_path(question), notice: "回答の投稿に成功しました。"
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
