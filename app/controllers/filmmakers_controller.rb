class FilmmakersController < ApplicationController
	respond_to :html, :json
	
	def show
		@filmmaker = Filmmaker.find(params[:id])
	  end
	
	def edit
            temp = Filmmaker.find params[:id]
            if current_user.id == temp.user.id
	      @filmmaker = temp
              render
            else
              flash[:error] = "Illegal Command"
              redirect_to root_path
            end
	end

        def update
    	@filmmaker = Filmmaker.find params[:id]
    	@filmmaker.update_attributes!(params[:filmmaker])
    	respond_with @filmmaker
  	end
end
