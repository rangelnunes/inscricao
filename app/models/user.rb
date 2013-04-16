class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :minicurso
  attr_accessible :cpf, :institution, :name, :minicurso_id, :tipo, :status
  
  # para ficar em portugues eu mudei no en.yml
  validates_presence_of :name, :message => 'deve ser informado'  
  validates_presence_of :cpf, :message => 'deve ser informado'
  validates_presence_of :institution, :message => 'deve ser informada'
  validates_presence_of :minicurso_id, :message => 'deve ser informado'
  validates_presence_of :password_confirmation, :message => 'deve ser informada'
	validates_presence_of :tipo, :message => 'deve ser informado'     
  
  validates_numericality_of :cpf
  validates_length_of :cpf, :is => 11
  
  has_and_belongs_to_many :roles
  
  def role?(role)
   return !!self.roles.find_by_name(role.to_s)
 end

	before_create :setup_role

	private

	def setup_role
		if self.role_ids.empty?
		  self.role_ids = [3]
		end
	end
	
	def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['name LIKE ? OR cpf LIKE ?', search_condition, search_condition])
	end
	
end
