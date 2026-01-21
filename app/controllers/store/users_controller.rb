class Store::UsersController < Store::BaseController
  before_action :set_user, only:%i[ show edit destroy update]
  def index
    @users = User.all
  end



  def show

  end 


  def edit

  end


  def destroy

  end

  def update
    if @user.update user_params
      redirect_to store_user_path @user, notice: "用户更新成功"
    else
      render :edit, notice: "更新失败"
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.expect(user: %w[first_name last_name email_address])
    end
end

