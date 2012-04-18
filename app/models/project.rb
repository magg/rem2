class Project < ActiveRecord::Base
	belongs_to :client
	has_one :team
	validates :nombre, :descripcion, :periodo, :presence => true
end
