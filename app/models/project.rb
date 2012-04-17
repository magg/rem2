class Project < ActiveRecord::Base
	belongs_to :client
	validates :nombre, :descripcion, :periodo, :presence => true
end
