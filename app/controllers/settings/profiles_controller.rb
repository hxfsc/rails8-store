class Settings::ProfilesController < Settings::BaseController

    def show

    end


    def update
      if Current.user.update profile_params
        redirect_to settings_profile_path, notice: "姓名更新成功"
      else 
        render :show
      end

    end

    
    private

      def profile_params 
        params.expect(user: %w[ first_name last_name ])
      end

end
