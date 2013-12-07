module MessageHelper

  def get_proper_name(message, box_type)
    if box_type == "inbox"
      id = message.sent_messageable_id
    else
      id = message.received_messageable_id
    end
    if User.exists?(id)
      return User.find(id).username
    else
      return "user no longer active"
    end
  end

  def get_to_username(message)
    id = message.received_messageable_id
    if User.exists?(id)
      return User.find(id).username
    end
    return "user no longer active"
  end


  def get_profile(message, type)
    if type == "sender"
      id = message.sent_messageable_id
    else
      id = message.received_messageable_id
    end
    if User.exists?(id)
      user = User.find(id)
    else
      return "user no longer active"
    end
    if user.filmmaker?
      return filmmaker_path(user.profilable.id)
    else
      return nonprofit_path(user.profilable.id)
    end
  end
end
