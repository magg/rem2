class Story < ActiveRecord::Base
# validation stuff...
 has_one :status
 has_and_belongs_to_many :sprints
 
 
 validates :name, :descripcion, :prioridad, :usuario, :presence => true
 validates :functionpts, :numericality => true, :numericality => {:greater_than => 0}, :on => :create, :on => :update
 validates :name, :uniqueness => true, :length => { 
   :minimum => 1, 
   :message => :too_short 
 }
end
