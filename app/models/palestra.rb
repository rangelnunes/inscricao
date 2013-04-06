class Palestra < ActiveRecord::Base
  belongs_to :palestrante
  attr_accessible :data, :hora, :title, :palestrante_id
end
