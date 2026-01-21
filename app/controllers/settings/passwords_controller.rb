class Settings::PasswordsController < Settings::BaseController
  def show
  end


  def update
    if Current.user.update password_params
      redirect_to setting_password_path, notice: "密码更新成功"
    else
      render :show,  notice: "密码更新失败"
    end
  end


  private

  def password_params
    params.expect(user: %w[password password_confirmation password_challenge]).with_defaults(password_challenge: "")
  end
end
