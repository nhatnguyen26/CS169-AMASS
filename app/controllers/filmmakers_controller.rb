class FilmmakersController < ApplicationController
  include ApplicationHelper
  respond_to :html, :json
  def index
    filter = params[:filter]
    by = params[:by]

    @filmmaker = filter_filmmakers(filter,by)

    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @filmmaker }
        end
  end

  def filter_filmmakers(filter, by)
    if filter == 'Specialty'
      @filmmaker = Filmmaker.select{|x| x.specialty.to_s.include?(by)}
    elsif filter == 'Region'
      @filmmaker = Filmmaker.select{|x| x.location.to_s.include?(by)}
    else
      @filmmaker = Filmmaker.all
    end
    return @filmmaker
  end


  def show
    @filmmaker = Filmmaker.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
          format.json { render json: @filmmaker }
        end
  end

  def edit
    if user_signed_in?
      temp = Filmmaker.find params[:id]
      if owner_of_profile(temp)
        @filmmaker = temp
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
      @filmmaker = Filmmaker.find params[:id]
      @filmmaker.update_attributes!(params[:filmmaker])
 	  respond_with @filmmaker
    end

	def destroy
		@filmmaker = Filmmaker.find params[:id]
		if @filmmaker.user.valid_password? params[:passcode]
			@filmmaker.user.destroy
			@filmmaker.destroy
			flash[:notice] = "Your account has been deleted" 
			redirect_to root_path
		else
			flash[:alert] = "You have entered wrong password"
			redirect_to settings_index_path
		end
	end
end
