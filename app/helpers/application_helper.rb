module ApplicationHelper
  def inplace_params(type,stractive)
    {:type => type, :ok_button => 'Save', :ok_button_class => 'btn', :cancel_button => 'Cancel', :cancel_button_class => 'btn', :activator => '#'+stractive}
  end

  def select_inplace_params
	{:type => :select, :ok_button => 'Save', :ok_button_class => 'btn', :cancel_button => 'Cancel', :cancel_button_class => 'btn', :collection => [["Open", "Open"], ["Pending", "Pending"], ["Completed", "Completed"]], :activator => '#status'}
  end

  def owner_of_profile(profile)
    if user_signed_in? && current_user.id == profile.user.id
      return true
    end
    return false
  end


  def logged_in_as_correct_user(profile_id)
    if user_signed_in?
      return current_user.id == profile_id
    end
    return false
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def edit
    if user_signed_in?
      if self.class.to_s == "FilmmakersController"
		temp = Filmmaker.find params[:id]
	  elsif self.class.to_s == "NonprofitsController"
		temp = Nonprofit.find params[:id]
	  end
      if owner_of_profile(temp)
        @resource = temp
        render
        return
      else
        flash[:error] = "You are not authorized to edit this profile"
        redirect_to root_path
        return
      end
    end
    flash[:error] = "You must log in first."
    redirect_to root_path
    return

  end

    def update
	  @resource = get_resource
      @resource.update_attributes!(params[:filmmaker])
 	  respond_with @resource
    end

	def destroy
		@resource = get_resource
		if @resource.user.valid_password? params[:passcode]
			@resource.user.destroy
			@resource.destroy
			flash[:notice] = "Your account has been deleted" 
			redirect_to root_path
		else
			flash[:alert] = "You have entered wrong password"
			redirect_to settings_index_path
		end
	end

	def set_resource
		if current_user.filmmaker?
	      Filmmaker.find params[:id]
	  	elsif current_user.nonprofit?
		  Nonprofit.find params[:id]
	  	end
	end

end
