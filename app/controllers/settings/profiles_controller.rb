class Settings::ProfilesController < Settings::BaseController

    def show

    end


    def update

    end

    
    private

      def profile_params 
        params.expect(user: %w[ first_name last_name ])
      end

end
