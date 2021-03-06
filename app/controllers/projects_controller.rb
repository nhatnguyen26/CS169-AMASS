class ProjectsController < ApplicationController
  include ProjectsHelper
  require 'time'
  respond_to :html, :json
  impressionist actions: [:show]

  def favorite
    apply_favorite(false)
  end

  def remove_favorite
    apply_favorite(true)
  end

  def apply_favorite(remove)
  	@project = Project.find params[:id]
	if remove
	    current_user.profilable.favorite_projects.delete @project
    	flash[:notice] = "You unfavorited #{@project.name}"
	else
		current_user.profilable.favorite_projects << @project
    	flash[:notice] = "You favorited #{@project.name}"
	end
    redirect_to project_path(@project.id)
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    
    check_user = user_signed_in?

    @projects = check_user_sign_in(check_user)

    filter = params[:filter]
    by = params[:by]

    @projects = project_filter(filter, by)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def check_user_sign_in(check_user)
    if check_user
      if params[:myprojects] == "true"
      #@projects = Project.find(:all, :conditions => ["organization IN (?)", current_user.username])
        @projects = current_user.profilable.projects
      elsif params[:myfavoriteprojects] == "true"
        @projects = current_user.profilable.favorite_projects
      end
    end
    return @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project.impressionist_count(:filter=>:session_hash)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    session[:return_to] ||= request.referer
    temp = Project.find params[:id]

    if logged_in_as_project_owner temp
      @project = temp
      render
    else
      flash[:error] = "You are not authorized to edit this project"
      redirect_to root_path
    end
  end

  def update
    @project = Project.find params[:id]
    get_input = params[:project]["deadline"]
    if (get_input)
      t1,t2,t3 = /(\d+)\/(\d+)\/(\d+)/.match(get_input).captures
      params[:project]["deadline"]  = t3 + t1 + t2
    end
    @project.update_attributes!(params[:project])
    respond_with @project
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if !user_signed_in?
       flash[:error] = "Please take a moment to sign up or log in first."
       redirect_to new_user_registration_path
    elsif current_user.filmmaker?
       flash[:error] = "Filmmaker cannot create projects"
       redirect_to root_path
    end
    @project = Project.new
  end


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.organization = current_user.name
    @project.status = "Open"
    temp = params[:project]["deadline"]
    date = /(\d+)\/(\d+)\/(\d+)/.match(temp)
    if not date.nil?
      t1,t2,t3 = date.captures
      @project.deadline = t3 + t1 + t2
    end
    save_project(@project.save)
  end

  def save_project(success)
    if success
      current_user.profilable.projects << @project
      current_user.profilable.save!
      flash[:notice] = "Project was successfully created."
      redirect_to project_path(@project.id)
    else
      flash[:error] = "Something went wrong."
      redirect_to new_project_path
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if logged_in_as_project_owner(@project)
      @project.destroy
      flash[:notice] = "Your project has been deleted."
    else
      flash[:notice] = "You are not authorized to delete this project."
    end
    redirect_to projects_path
  end
=begin
  def logged_in_as_project_owner(project)
    if current_user == nil || current_user.profilable_type == "Filmmaker"
      return false
    end
    project_owner = User.find_by_name(project.organization)
    if project_owner == nil
      return false
    end
    project.nonprofit_id == current_user.profilable_id
  end
=end



=begin
  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
=end
end
