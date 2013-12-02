class CustomMessage < ActsAsMessageable::Message
  attr_accessible :body, :topic
end
