class FilmmakersController < ApplicationController
	respond_to :html, :json
	
	def show
		@filmmaker = Filmmaker.find(params[:id])
	  end
	
	def edit
	    @filmmaker = Filmmaker.find params[:id]
	end

        def update
    	@filmmaker = Filmmaker.find params[:id]
    	@filmmaker.update_attributes!(params[:filmmaker])
    	respond_with @filmmaker
  	end
end
