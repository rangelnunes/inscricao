class ApplicationController < ActionController::Base
  protect_from_forgery

	def after_sign_in_path_for(resource)
    root_path
  end


	rescue_from CanCan::AccessDenied do |exception|
		exception.default_message = "Você não tem autorização para realizar esta operação!"	  
		flash[:error] = exception.message
	  redirect_to root_path
	end


end
