class ProjectsController < ApplicationController
  require 'time'
  respond_to :html, :json
  impressionist actions: [:show]

  def favorite
    @project = Project.find params[:id]
    current_user.profilable.favorite_projects << @project
    flash[:notice] = "You favorited #{@project.name}"
    redirect_to projects_path(:myfavoriteprojects => :true)
  end

  def remove_favorite
    @project = Project.find params[:id]
    current_user.profilable.favorite_projects.delete @project
    flash[:notice] = "You unfavorited #{@project.name}"
    redirect_to projects_path(:myfavoriteprojects => :true)
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    if user_signed_in?
      if params[:myprojects] == "true"
      #@projects = Project.find(:all, :conditions => ["organization IN (?)", current_user.username])
        @projects = current_user.profilable.projects
      elsif params[:myfavoriteprojects] == "true"
        @projects = current_user.profilable.favorite_projects
      end
    end
    
     
    filter = params[:filter]
    by = params[:by]

    if filter == 'all' or filter == 'New Posts'
      @projects = filter_projects(filter)
    elsif filter == 'Type' or filter == 'Region'
      @projects = filter_projects_by(filter, by)
    elsif filter == 'Budget' or filter == 'Popular'
      @projects = filter_projects_by2(filter, by)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def filter_projects(filter)
    if filter == 'all'
      return Project.all
    else
      return Project.select{|x| x.created_at + 604800 >= Time.now}
    end
  end

  def filter_projects_by(filter, by)
    if filter == 'Type'
      return Project.select{|x| x.category.to_s.downcase == by.downcase}
    else
      return Project.select{|x| x.location.to_s.downcase == by.downcase}
    end
  end

  def filter_projects_by2(filter, by)
    if filter ==  'Budget'
      return Project.select{|x| x.budget.to_i.to_s.length == by.length}
    else
      return Project.select{|x| x.impressionist_count >= 1}
    end
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
    if (params[:project]["deadline"])
      temp = params[:project]["deadline"]
      t1,t2,t3 = /(\d+)\/(\d+)\/(\d+)/.match(temp).captures
      temp = t3 + t1 + t2
      params[:project]["deadline"] = temp
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
    @project.status = "pending"
    temp = params[:project]["deadline"]
    date = /(\d+)\/(\d+)\/(\d+)/.match(temp)
  if not date.nil?
    t1,t2,t3 = date.captures
      temp = t3 + t1 + t2
  end
    @project.deadline = temp
    if @project.save
      current_user.profilable.projects << @project
      current_user.profilable.save!
      flash[:notice] = "Project was successfully created."
      redirect_to project_path(@project.id)
    else
      flash[:error] = "Something went wrong."
      redirect_to new_project_path
    end

  end


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
