module FilmMakersHelper


#  def logged_in_as_correct_user(profile_id)
#    if user_signed_in?
#      return current_user.id == profile_id
#    end
#    return false
#  end

  def get_active_projects(nonprofit)
    return nonprofit.projects.select {|proj| proj.status != 'Completed'}
  end

  def get_completed_projects(nonprofit)
    return nonprofit.projects.select {|proj| proj.status == 'Completed'}
  end

end

