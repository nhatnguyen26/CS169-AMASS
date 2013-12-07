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

end
