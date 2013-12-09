class SettingsController < ApplicationController
	def index
		if current_user.filmmaker?
			@filmmaker = current_user
		elsif current_user.nonprofit?
			@nonprofit = current_user
		end	
	end
end
