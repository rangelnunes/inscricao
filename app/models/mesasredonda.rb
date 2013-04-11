class Mesasredonda < ActiveRecord::Base

  belongs_to :palestrante
  attr_accessible :data, :title
  
  # para ficar em portugues eu mudei no en.yml
  validates_presence_of :title, :message => 'deve ser informado'
  validates_presence_of :data, :message => 'deve ser informada'
  
  validates_uniqueness_of :title 

end
