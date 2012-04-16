class Client < ActiveRecord::Base
	has_one :usuario
	has_many :projects
        validates :nombre, :appat, :apmat, :presence => true
end
