class Minicurso < ActiveRecord::Base
  belongs_to :palestrante
  attr_accessible :date_fim, :date_ini, :title, :vacancies, :palestrante_id, :time_ini, :time_fim
  
  has_many :users
end
