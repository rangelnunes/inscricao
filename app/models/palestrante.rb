class Palestrante < ActiveRecord::Base
  attr_accessible :institution, :lattes, :name
  
  has_many :palestras
  has_many :minicursos
  has_many :mesasredondas
	
	# para ficar em portugues eu mudei no en.yml
  validates_presence_of :name, :message => 'deve ser informado'
  validates_presence_of :institution, :message => 'deve ser informada'
  
end
