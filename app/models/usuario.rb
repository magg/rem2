class Usuario < ActiveRecord::Base
	has_many :admins, :clients, :students
	validates :username, :password_digest, :tipo, :presence => true
end
