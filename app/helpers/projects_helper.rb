module ProjectsHelper
  def thumbnail_exist?(id)
  File.exist?("#{Rails.root}/app/assets/images/projects/#{id}/thumb.jpg")
  end

  # for the sake of codeclimate complaining complexity of codes
  # chop into multiple tiny methods

  def project_filter(filter, by)
    if filter == 'all' or filter == 'New Posts'
      @projects = filter_projects(filter)
    elsif filter == 'Type' or filter == 'Region'
      @projects = filter_projects_by(filter, by)
    elsif filter == 'Budget' or filter == 'Popular'
      @projects = filter_projects_by2(filter, by)
    end
    return @projects
  end

  def filter_projects(filter)
    if filter == 'all'
      return Project.all
    else
      return Project.select{|x| x.created_at + 604800 >= Time.now}
    end
  end

  def filter_projects_by(filter, by)
    if filter == 'Type'
      return Project.select{|x| x.category.to_s.downcase == by.downcase}
    else
      return Project.select{|x| x.location.to_s.downcase == by.downcase}
    end
  end

  def filter_projects_by2(filter, by)
    if filter ==  'Budget'
      return Project.select{|x| x.budget.to_i.to_s.length == by.length}
    else
      return Project.select{|x| x.impressionist_count >= 1}
    end
  end

  def logged_in_as_project_owner(project)
    if current_user == nil || current_user.profilable_type == "Filmmaker"
      return false
    end
    project_owner = User.find_by_name(project.organization)
    if project_owner == nil
      return false
    end
    project.nonprofit_id == current_user.profilable_id
  end


end

