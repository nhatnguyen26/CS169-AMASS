module HowitworksHelper
  def get_correct_link(type)
    if !user_signed_in?
      if type == 'nonprofit'
        return new_user_registration_path(:usertype => 'nonprofit')
      else
        return new_user_registration_path(:usertype => 'filmmaker')
      end
    end
    if current_user.filmmaker?
      return edit_filmmaker_path(current_user.profilable.id)
    else
      return edit_nonprofit_path(current_user.profilable.id)
    end
  end

end
