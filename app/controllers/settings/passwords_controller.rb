class Settings::PasswordsController < Settings::BaseController
  def show
  end


  def update

  end


  private

  def password_params
    params.expect(user: %w[password password_confirmation password_challenge]).with_defaults(password_challenge: "")
  end

end

