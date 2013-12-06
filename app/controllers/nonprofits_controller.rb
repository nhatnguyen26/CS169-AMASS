class NonprofitsController < ApplicationController
  include ApplicationHelper
  def show
    @nonprofit = Nonprofit.find(params[:id])
    end


  def edit
    if user_signed_in?
      temp = Nonprofit.find params[:id]
      if owner_of_profile(temp)
        @nonprofit = temp
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
      @nonprofit = Nonprofit.find params[:id]
      @nonprofit.update_attributes!(params[:nonprofit])
      flash[:notice] = "Your profile was successfully updated."
      respond_with @nonprofit
    end
end
