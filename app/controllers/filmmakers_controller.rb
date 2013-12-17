class FilmmakersController < ApplicationController
  include ProfileHelper
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
end
