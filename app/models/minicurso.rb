class Minicurso < ActiveRecord::Base
  belongs_to :palestrante
  attr_accessible :date_fim, :date_ini, :title, :vacancies, :palestrante_id, :time_ini, :time_fim
  
  has_many :users

  # para ficar em portugues eu mudei no en.yml
  validates_presence_of :title, :message => 'deve ser informado'
  validates_presence_of :date_ini, :message => 'deve ser informada'
  validates_presence_of :date_fim, :message => 'deve ser informada'
  validates_presence_of :time_ini, :message => 'deve ser informado'
  validates_presence_of :time_fim, :message => 'deve ser informado'    
  validates_presence_of :vacancies, :message => 'deve ser informada'
  validates_presence_of :palestrante_id, :message => 'deve ser informado'  
  
  validates_uniqueness_of :title
  
  validates_numericality_of :vacancies, :message => "deve ser numero"
  
  validates_associated :palestrante
  
	validate :validate_end_date_before_start_date

  def validate_end_date_before_start_date
    if date_fim && date_ini
      errors.add(:date_fim, "deve ser maior que a data de inicio") if date_fim < date_ini
    end
  end
  
  def self.inscritos(minicurso)
  	find(:first, :conditions => ['id = ?', minicurso]).users
	end
  
end
