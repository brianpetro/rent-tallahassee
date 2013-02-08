class ApplicationController < ActionController::Base
	before_filter :meta_defaults
  protect_from_forgery
  before_filter :site_name
  def site_name
		if request.url.split('?').first == 'http://localhost:3000/users/current'
			@site_name = "Localhost"
		end
		if request.url.split('.com').first == 'http://www.rent-tallahassee'
			@site_name = "Rent Tallahassee"
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
    @meta_title = "Rent Tallahassee"
    @meta_keywords = "Tallahassee, rent, apartments, houses, condos, lease, sublet, sublease, realestate, listings, find, fsu, famu, tcc, community college, florida state, townhomes, rentals, complexes, apts, near, campus, homes"
    @meta_description = "Use Rent-Tallahassee.com to find Apartments, Condos, Townhomes and Houses for rent. Special Offers! Sublease from students. Summer, Fall and Spring semester. Apartments near Florida State FSU, TCC, and FAMU. Find the best deals here."
  end
  
end
