class SettingsController < ApplicationController
	def index
		@user = current_user
		if user_signed_in?
			@resource = current_user.profilable
		else
			flash[:error] = "You are not authorized to access this page"
       	 	redirect_to root_path
        return
		end
	end

	def update_password 
		@user = User.find(current_user.id)
		if @user.update_with_password(params[:user])
			sign_in @user, :bypass => true
			flash[:notice] = 'You have successfully changed your password'
			redirect_to settings_index_path
		else
			flash[:alert] = 'Wrong password or invalid password combination. Valid password should have at least 8 characters'
			redirect_to settings_index_path
		end
	end
end
