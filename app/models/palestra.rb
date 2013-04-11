class Palestra < ActiveRecord::Base

  belongs_to :palestrante
  attr_accessible :data, :hora, :title, :palestrante_id

  # para ficar em portugues eu mudei no en.yml
  validates_presence_of :title, :message => 'deve ser informado'
  validates_presence_of :data, :message => 'deve ser informada'
  validates_presence_of :hora, :message => 'deve ser informado'
  validates_presence_of :palestrante_id, :message => 'deve ser informado'  
  
  validates_uniqueness_of :title
   
  validates_associated :palestrante
    
end
