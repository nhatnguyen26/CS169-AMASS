class NonprofitsController < ApplicationController
  include ApplicationHelper
  respond_to :html, :json
  def show
    @nonprofit = Nonprofit.find(params[:id])
	@projects = Project.all
	@active_projects = @nonprofit.projects.select {|proj| proj.status != 'Completed'}
	@completed_projects = @nonprofit.projects.select {|proj| proj.status == 'Completed'}
	respond_to do |format|
        format.html # show.html.erb
    	format.json { render json: @active_projects }
    	format.json { render json: @completed_projects }
	  end
    end


  def edit
    if user_signed_in?
      temp = Nonprofit.find params[:id]
      if owner_of_profile(temp)
        @nonprofit = temp
        render
        return
      else
        flash[:error] = "You are not authorized to edit this profile"
        redirect_to root_path
        return
      end
    end
    flash[:error] = "You must log in first."
    redirect_to root_path
    return
  end

    def update
      @nonprofit = Nonprofit.find params[:id]
      @nonprofit.update_attributes!(params[:nonprofit])
      respond_with @nonprofit
    end
end
