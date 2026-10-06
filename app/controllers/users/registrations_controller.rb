# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [ :update ]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :introduction, :icon ])
  end

  def after_update_path_for(resource)
    if params.dig(:user, :password).present?
      flash[:notice] = "パスワードを変更しました。"
    end

    super
  end
end
