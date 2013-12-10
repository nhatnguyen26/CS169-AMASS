module MessageHelper

  def check_box_type(box_type)
    if box_type.eql?('inbox')
      @messages = current_user.received_messages
    elsif box_type.eql?('sent')
      @messages = current_user.sent_messages
    elsif box_type.eql?('trash')
      @messages = current_user.deleted_messages
    end
  end

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

  def num_unread
    count = 0
    current_user.received_messages.each{ |m| count+=1 unless m.opened?}
    return count
  end
end
