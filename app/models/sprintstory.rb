class Sprintstory < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :story
	accepts_nested_attributes_for :sprint
	
	validates :fechainicio, :fechafin, :presence => true
end
