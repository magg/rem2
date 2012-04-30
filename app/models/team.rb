class Team < ActiveRecord::Base
	has_many :students
	belongs_to :project
 	validates :nombre, :presence => true
 	validates :project_id, :uniqueness => true
 	attr_accessible :project_id 
end
