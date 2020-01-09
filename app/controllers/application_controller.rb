class ApplicationController < ActionController::Base
	before_action :authenticate_user!


	def after_sing_out_path_for(resource_or_scope)
	    if resource_or_scope == :user
	      new_user_session_path
	    end
  	end

  	layout :layout
  	def layout
    # only turn it off for login pages:
    if current_user != nil
      @layout = "application"
    else 
      @layout = "applicationlogin"              
    end 
    #is_a?(Devise::SessionsController) ? "applicationlogin" : "application"
    # or turn layout off for every devise controller:
    #devise_controller? && "applicationlogin"
  end

end
