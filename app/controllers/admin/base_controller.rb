class Admin::BaseController < ApplicationController
  before_action :check_admin
  #↓layout宣言
  layout 'admin/layouts/application'

  private

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to admin_login_path
  end

#↓管理者権限を持っているか確認する
  def check_admin
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end
end