class PagesController < ApplicationController

	before_filter :load_resources
	before_filter :authenticate_user!,:except => [:index, :programacao] 
		
  def index
  end
  
  def programacao
  end

  def cadastro
  	@user = User.find(current_user.id)
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
