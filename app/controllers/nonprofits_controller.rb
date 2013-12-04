class NonprofitsController < ApplicationController
  include ApplicationHelper
  def show
    @nonprofit = Nonprofit.find(params[:id])
    end


  def edit
    if user_signed_in?
      if logged_in_as_correct_user(@nonprofit.id)
        @nonprofit = Nonprofit.find params[:id]
        render
      else
        flash[:error] = "You are not authorized to edit this profile"
        redirect_to root_path
      end
    else
      flash[:error] = "You must log in first."
    end
  end

    def update
      @nonprofit = Nonprofit.find params[:id]
      @nonprofit.update_attributes!(params[:nonprofit])
      flash[:notice] = "Your profile was successfully updated."
      redirect_to nonprofit_path(@nonprofit)
    end
end
