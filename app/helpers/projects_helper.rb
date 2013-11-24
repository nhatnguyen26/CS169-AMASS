module ProjectsHelper
  def thumbnail_exist?(id)
  File.exist?("#{Rails.root}/app/assets/images/projects/#{id}/thumb.jpg")
  end

  def inplace_params(type,stractive)
    {:type => type, :ok_button => 'Save', :ok_button_class => 'btn', :cancel_button => 'Cancel', :cancel_button_class => 'btn', :activator => '#'+stractive}
  end

  def logged_in_as_project_owner(project)
    project_owner = User.find_by_name(project.organization)
    current_user.id == project_owner.id
  end
end

