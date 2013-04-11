class RegistrationsController < Devise::RegistrationsController

	def create
      if verify_recaptcha
        super
      else
        build_resource
        clean_up_passwords(resource)
        #flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."      
        flash.now[:alert] = "Erro no codigo de confirmacao digitado. Por favor, digite novamente."      
        flash.delete :recaptcha_error
        render :new
      end
    end

		protected

      def after_sign_up_path_for(resource)
        pages_cadastro_path
      end  
end
