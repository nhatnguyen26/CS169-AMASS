class MessageController < ApplicationController
  def new
    # display form
  end

  # POST /message/create
  def create
    recipient = User.find(params[:recipient_id])
    current_user.send_message(recipient, {:body => params[:body], :topic => params[:topic]})
    flash[:notice] = 'Your message to the Filmmaker is successful'
    redirect_to filmmaker_path recipient.profilable_id
  end
  
  def index
    @inbox = current_user.received_messages
    @sent = current_user.sent_messages
  end
end
