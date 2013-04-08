class Mesasredonda < ActiveRecord::Base
  belongs_to :palestrante
  attr_accessible :data, :title
  
  validates_presence_of :name
end
