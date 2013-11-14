module FilmMakersHelper
  def inplace_params(str)
    {:type => 'textarea', :ok_button => 'Save', :ok_button_class => 'btn', :cancel_button => 'Cancel', :cancel_button_class => 'btn', :activator => '#'+str}
  end
    
end

