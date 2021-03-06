class NonprofitsController < ApplicationController
  include ProfileHelper
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
end
