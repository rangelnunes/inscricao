class PagesController < ApplicationController

	before_filter :load_resources
	
  def index
  end
  
  def programacao
  end

  def status
  	@user = User.find(current_user.id)
  end
  
  private 
  
  def load_resources
  	@palestras = Palestra.all
  	@minicursos = Minicurso.all
  	@mesasredondas = Mesasredonda.all
  end
end
