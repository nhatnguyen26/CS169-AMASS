class MessageController < ApplicationController
  before_filter :signed_in_as_user
  def signed_in_as_user
    if !user_signed_in?
      flash[:error] = 'Please sign in'
      redirect_to root_path
    end
  end
  def new
    # display form
  end

  def apply
    project_to_apply = Project.find(params[:id])
    non_profit = project_to_apply.nonprofit
    if !current_user.filmmaker?
      flash[:error] = 'Only filmmaker can join a project'
      redirect_to projects_path
    else
      recipient = User.find(non_profit.user.id)
      current_user.send_message(recipient, {:body => 'I want to join your project', :topic => "Application to join #{project_to_apply.name}"})
      flash[:notice] = 'You have successfully applied for this project'
      redirect_to project_path(project_to_apply.id)
    end
  end
  
  # POST /message/create
  def create
    recipient = User.find(params[:recipient_id])
    current_user.send_message(recipient, {:body => params[:body], :topic => params[:topic]})
    flash[:notice] = 'Your message to the Filmmaker is successful'
    redirect_to filmmaker_path recipient.profilable_id
  end
  
  def index
    session[:box_type] = params[:box_type] || 'inbox'
    if (params[:box_type].nil?)
      redirect_to message_index_path(:box_type => session[:box_type])
    end
    if params[:box_type].eql?('inbox')
      @messages = current_user.received_messages
    elsif params[:box_type].eql?('sent')
      @messages = current_user.sent_messages
    elsif params[:box_type].eql?('trash')
      @messages = current_user.deleted_messages
    end
  end

  def show
    @message = find_message_from_proper_place(session[:box_type],params[:id])
    @message.open
    @message.save!
    @sender = User.find_by_id(@message.sent_messageable_id).name
  end

  def trash
    message_to_trash = find_message_from_proper_place(session[:box_type],params[:id])
    current_user.delete_message(message_to_trash)
    redirect_to message_index_path(:box_type => session[:box_type])
  end

  def find_message_from_proper_place(location,id)
    if (location.eql?('trash'))
      return current_user.deleted_messages.find(id)
    else
      return current_user.messages.find(id)
    end
  end

end
