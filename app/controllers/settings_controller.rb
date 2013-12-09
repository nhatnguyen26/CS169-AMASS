class SettingsController < ApplicationController
	def index
		if user_signed_in?
			@resource = current_user.profilable
		else
			flash[:error] = "You are not authorized to access this page"
       	 	redirect_to root_path
        return
		end
	end
end
