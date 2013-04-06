class Palestrante < ActiveRecord::Base
  attr_accessible :institution, :lattes, :name
  
  has_many :palestras
  has_many :minicursos
  has_many :mesasredondas
end
