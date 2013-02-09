class ApplicationController < ActionController::Base
	before_filter :meta_defaults
  protect_from_forgery
  before_filter :site_name
  def site_name
		if request.domain == 'localhost'
			@site_name = "Localhost"
		end
		if request.domain == 'rent-tallahassee.com'
			@site_name = "Rent Tallahassee"
		end
		if request.domain == 'findfrackingjobs.com'
			@site_name = "Fracking Jobs"
		end
		if request.domain == 'rent-philadelphia.com'
			@site_name = "Rent Philadelphia"
		end
	end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        users_path
      when 'silver'
        new_classified_path(plan: 'silver')
      when 'gold'
        new_classified_path(plan: 'gold')
      when 'platinum'
        new_classified_path(plan: 'platinum')
      else
        root_path
    end
  end

 def meta_defaults
    @meta_title = ""
    @meta_keywords = ""
    @meta_description = ""
  end
  
end
