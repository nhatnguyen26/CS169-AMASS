class FilmmakersController < ApplicationController
  include ApplicationHelper
  respond_to :html, :json
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
            temp = Filmmaker.find params[:id]
            if current_user.id == temp.user.id
          @filmmaker = temp
                render
            else
                flash[:error] = "Illegal Command"
                redirect_to root_path
            end
      @filmmaker = Filmmaker.find params[:id]
  end

    def update
      @filmmaker = Filmmaker.find params[:id]
      @filmmaker.update_attributes!(params[:filmmaker])
  respond_with @filmmaker
    end
end
