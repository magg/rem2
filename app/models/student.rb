class Student < ActiveRecord::Base
  has_many :tasks
  has_one :team, :usuario
  validates :nombre, :appat, :apmat, :rol, :presence => true
end
