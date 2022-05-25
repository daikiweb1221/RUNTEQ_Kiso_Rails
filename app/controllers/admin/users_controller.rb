class Admin::UsersController < Admin::BaseController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  @search = User.ransack(params[:q])
  @users = @search.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('.delete')
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :avatar,
      :avatar_cache
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
