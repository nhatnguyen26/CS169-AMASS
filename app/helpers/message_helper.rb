module MessageHelper

  def get_sender_name(message)
    id = message.sent_messageable_id
    user = User.find(id)
    if user != nil
      return user.username
    else
      return "user no longer active"
    end
  end

  def get_profile(message)
    user = User.find(message.sent_messageable_id)
    if user.filmmaker? && user != nil
      return filmmaker_path(user.profilable.id)
    else
      return nonprofit_path(user.profilable.id)
    end
    return "user no longer active"
  end
end
