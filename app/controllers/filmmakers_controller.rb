class FilmmakersController < ApplicationController
	def index
		@filmmaker = Filmmaker.all

   		filter = params[:filter]
    		by = params[:by]
    
		if filter == 'all'
			@filmmaker = Filmmaker.all
		elsif filter == 'Specialty'
			@filmmaker = Filmmaker.select{|x| x.specialty.to_s.include?(by)}
		elsif filter == 'Region'
			@filmmaker = Filmmaker.select{|x| x.location.to_s.include?(by)}
		end

		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @filmmaker }
    		end
	end

	def show
		@filmmaker = Filmmaker.find(params[:id])

    		respond_to do |format|
           	format.html # show.html.erb
        	format.json { render json: @filmmaker }
    		end
	end
	
	def edit
	    @filmmaker = Filmmaker.find params[:id]
	end

  	def update
    	@filmmaker = Filmmaker.find params[:id]
    	@filmmaker.update_attributes!(params[:filmmaker])
    	flash[:notice] = "Your profile was successfully updated."
    	redirect_to filmmaker_path(@filmmaker)
  	end
end
