class Admin::UsersController < Admin::ApplicationController
  before_action :check_deleted, only: [:edit]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @user.get_answer_rank
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報の更新に成功しました。"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :gender, :age, :study_background, :living_area, :email, :answer_rank, :is_deleted)
  end

  def check_deleted
    user = User.find(params[:id])
    if user.is_deleted
      redirect_to admin_users_path, alert: "このユーザーは既に退会しています。"
    end
  end

end
