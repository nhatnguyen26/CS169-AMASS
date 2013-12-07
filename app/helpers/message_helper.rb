module MessageHelper

  def get_proper_name(message, box_type)
    if box_type == "inbox"
      id = message.sent_messageable_id
    else
      id = message.received_messageable_id
    end
    user = User.find(id)
    if user != nil
      return user.username
    else
      return "user no longer active"
    end
  end

  def get_to_username(message)
    user = User.find(message.received_messageable_id)
    if user != nil
      return user.username
    end
    return "user no longer active"
  end


  def get_profile(message, type)
    if type == "sender"
      user = User.find(message.sent_messageable_id)
    else
      user = User.find(message.received_messageable_id)
    end
    if user.filmmaker? && user != nil
      return filmmaker_path(user.profilable.id)
    else
      return nonprofit_path(user.profilable.id)
    end
    return "user no longer active"
  end
end
