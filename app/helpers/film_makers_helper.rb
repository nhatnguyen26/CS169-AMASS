module FilmMakersHelper
  def inplace_params(str)
    {:type => 'textarea', :ok_button => 'Save', :ok_button_class => 'btn', :cancel_button => 'Cancel', :cancel_button_class => 'btn', :activator => '#'+str}
  end

  def logged_in_as_correct_user(profile_id)
    current_user.id == profile_id
  end
    
end

