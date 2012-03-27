class Story < ActiveRecord::Base
# validation stuff...
 has_one :status
 has_many :sprintstories
 has_many :sprints :through => :sprintstories
 validates :name, :descripcion, :prioridad, :usuario, :presence => true
 validates :functionpts, :numericality => true
 validates :name, :uniqueness => true, :length => { 
   :minimum => 10, 
   :message => :too_short 
 }
end
