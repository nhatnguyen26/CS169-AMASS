# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)

    if page_name.include?('sign')
      path_sign_in_out(page_name)
    elsif page_name.include?('edit')
      path_edit(page_name)
    elsif page_name.include?('profile')
      path_profile(page_name)
    elsif page_name.include?('page')
      page_mis(page_name)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  def path_sign_in_out(page_name)
    case page_name
	when /^the sign up page$/
	  '/sign_up'
    when /^the sign up page for filmmaker$/
      new_user_registration_path(:usertype=>"filmmaker")
	when /^the sign up page for nonprofit$/
      new_user_registration_path(:usertype=>"nonprofit")
    when /^the sign in page$/
      '/sign_in' 
    end
  end

  def path_profile(page_name)
    case page_name
    when /^the profile page of "(.*)"$/
      user = User.find_by_username($1)
      id = user.profilable_id
      if user.filmmaker?
        '/filmmakers/' + id.to_s
      elsif user.nonprofit?
  '/nonprofits/' + id.to_s
      end
    end
  end

  def path_edit(page_name)
    case page_name
    when /^the edit page of "(.*)"$/
      user = User.find_by_username($1)
      id = user.profilable_id
      if user.filmmaker?
        '/filmmakers/' + id.to_s + '/edit'
      elsif user.nonprofit?
        '/nonprofits/' + id.to_s + '/edit'
      end
    when /^the edit project page for "(.*)"$/
      project = Project.find_by_name($1)
      id = project.id
      '/projects/' + id.to_s + '/edit'
    end
  end

  def page_mis(page_name)
    case page_name
    when /^the home\s?page$/
      '/'
    when /^the projects page?/
      '/projects'
    when /^the filmmakers page?/
      '/filmmakers'
    when /^the project page for "(.*)"$/
      project = Project.find_by_name($1)
      id = project.id
      '/projects/' + id.to_s
    when /^the my projects page?/
      '/projects'
    when /^the "(.*)" page?/
      project_path(Project.find_by_name($1))
    when /^the create project page?/
      '/projects/new' 
    when /^the admin page$/
      '/admin/login'
    when /^the admin logout page$/
      '/admin/logout'
    when /^the my favorite projects page?/
      '/projects?myfavoriteprojects=true'
    end
  end
end

World(NavigationHelpers)
