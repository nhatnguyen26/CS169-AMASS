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
      flash[:notice] = 'You have applied to the project'
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
