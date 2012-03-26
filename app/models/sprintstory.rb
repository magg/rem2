class Sprintstory < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :story
	validates :fechainicio, :fechafin, :presence => true
end
