class Usuario < ActiveRecord::Base
  has_one :admin, :dependent => :destroy
  has_one :client, :dependent => :destroy
  has_one :student, :dependent => :destroy
  validates :username, :presence => true, :uniqueness => true
  has_secure_password
  attr_accessible :username, :password, :password_confirmation, :tipo
  validates_presence_of :password, :on => :create
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Usuario.exists?(column => self[column])
  end
  
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
