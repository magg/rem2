class Usuario < ActiveRecord::Base
  has_one :admin, :dependent => :destroy
  has_one :client, :dependent => :destroy
  has_one :student, :dependent => :destroy
  validates :username, :presence => true, :uniqueness => true
  has_secure_password
  attr_accessible :username, :password, :password_confirmation, :tipo
  validates_presence_of :password, :on => :create
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
