class Users::RegistrationsController < Devise::RegistrationsController
def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      authenticated = resource.active_for_authentication?
      check_authentication(authenticated)

    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected 
		
  def after_sign_up_path_for(resource)
    if resource.filmmaker?
      resource.profilable = Filmmaker.create!
      resource.save!
    elsif resource.nonprofit?
      resource.profilable = Nonprofit.create!
      resource.save!
    end		
    root_path
  end
end

  def check_authentication(authenticated)
    if authenticated
      resource.usertype = params[:usertype]
      set_flash_message :notice, :signed_up if is_flashing_format?
      sign_up(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)
    else
      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
      expire_data_after_sign_in!
      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    end
  end
