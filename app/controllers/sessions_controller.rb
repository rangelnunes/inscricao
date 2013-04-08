class SessionsController < Devise::SessionsController

	before_filter :load_resources
	
		
	private 

	def load_resources
		@users = User.all
		#@user = User.find(current_user.id)
	end
end
