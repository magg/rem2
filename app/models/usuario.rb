class Usuario < ActiveRecord::Base
<<<<<<< HEAD
	has_many :admins, :clients, :students
	validates :username, :password_digest, :tipo, :presence => true
=======
	has_one :admin
	has_one :client
	has_one :student
	
	validates :username, :presence => true, :uniqueness => true

  has_secure_password
  attr_accessible :username, :password, :password_confirmation, :tipo
  validates_presence_of :password, :on => :create

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
	
>>>>>>> students
end
