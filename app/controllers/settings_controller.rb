class SettingsController < ApplicationController
	def index
		@resource = current_user.profilable
	end
end
