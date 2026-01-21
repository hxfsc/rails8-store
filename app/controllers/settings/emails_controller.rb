class Settings::EmailsController < Settings::BaseController
  
  def show

  end

  
  def update
    if Current.user.update email_params
      UserMailer.with(user: Current.user).email_confirmation.deliver_later
      redirect_to settings_email_path, notice: "邮箱更新成功"
    else
      render :new, notice: "更新失败"
    end
  end

  private

    def email_params
      params.expect(user: [:password_challenge, :unconfirmed_email]).with_defaults(password_challenge: "")
    end

end
