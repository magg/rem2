class Team < ActiveRecord::Base
	has_many :students
	belongs_to :project
 	validates :nombre, :presence => true
end
