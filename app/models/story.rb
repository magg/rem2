class Story < ActiveRecord::Base
# validation stuff...
 has_one :status
 has_and_belongs_to_many :sprints
 
 
 validates :name, :descripcion, :prioridad, :usuario, :presence => true
 validates :functionpts, :numericality => true
 validates :name, :uniqueness => true, :length => { 
   :minimum => 5, 
   :message => :too_short 
 }
end
