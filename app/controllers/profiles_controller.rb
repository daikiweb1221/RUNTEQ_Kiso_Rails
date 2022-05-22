class ProfilesController < ApplicationController
  before_action :my_profile, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
    render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :avatar,
      :avatar_cache
    )
  end

  def my_profile
    @user = User.find(current_user.id)
  end
end
