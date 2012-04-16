class Client < ActiveRecord::Base
	belongs_to :usuario
	has_many :projects
        validates :nombre, :appat, :apmat, :presence => true
end
