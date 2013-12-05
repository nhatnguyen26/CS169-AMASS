class MessageController < ApplicationController
  def new
    # display form
  end

  def apply
  end
  # POST /message/create
  def create
    recipient = User.find(params[:recipient_id])
    current_user.send_message(recipient, {:body => params[:body], :topic => params[:topic]})
    flash[:notice] = 'Your message to the Filmmaker is successful'
    redirect_to filmmaker_path recipient.profilable_id
  end
  
  def index
    params[:box_type] ||= 'inbox'
    if params[:box_type].eql?('inbox')
      @messages = current_user.received_messages
    elsif params[:box_type].eql?('sent')
      @messages = current_user.sent_messages
    end
  end

  def show
    @message = current_user.messages.find(params[:id])
    @message.open
    @message.save!
    @sender = User.find_by_id(@message.sent_messageable_id).name
  end
end
