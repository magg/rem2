class Project < ActiveRecord::Base
	belongs_to :client
	has_one :team
	attr_accessible :nombre,:descripcion, :periodo, :client_id, :team_attributes
	validates :nombre, :descripcion, :periodo, :presence => true
end
