class Story < ActiveRecord::Base
# validation stuff...
 has_one :status, :criterio
 has_many :tasks
 has_many :sprintstories
 has_many :sprints, :through => :sprintstories



 has_many  validates :name, :descripcion, :prioridad, :usuario, :presence => true
 validates :functionpts, :numericality => true
 validates :status_id_exists
 validates :name, :uniqueness => true, :length => { 
   :minimum => 10, 
   :message => :too_short 
 }
 def status_id_exists
	if Status.find_by_id(self.status_id) ==nil
	errors.add(:base, "No se encuentra el status")
	end
 end
end
