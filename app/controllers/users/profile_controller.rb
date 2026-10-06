class Users::ProfileController < ApplicationController
  def update
    if current_user.update(profile_params)
      redirect_to users_profile_path, notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:icon, :name, :introduction)
  end
end
