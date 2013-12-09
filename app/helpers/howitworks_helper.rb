module HowitworksHelper
  def get_correct_link(type)
    if !user_signed_in?
      return new_user_session_path
    end
    if current_user.filmmaker?
      return edit_filmmaker_path(current_user.profilable.id)
    else
      return edit_nonprofit_path(current_user.profilable.id)
    end
  end

end
