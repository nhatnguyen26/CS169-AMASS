module ProjectsHelper
  def thumbnail_exist?(id)
  File.exist?("#{Rails.root}/app/assets/images/projects/#{id}/thumb.jpg")
  end

  def logged_in_as_project_owner(org)
    if current_user == nil || current_user.profilable_type == "Filmmaker"
      return false
    end
    project_owner = User.find_by_name(org)
    if project_owner == nil
      return false
    end
    current_user.id == project_owner.id
  end
end

