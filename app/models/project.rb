class Project < ActiveRecord::Base
	has_one :client
	validates :nombre, :descripcion, :periodo, :presence => true
end
