class Student < ActiveRecord::Base
  has_many :tasks
  has_one :team
  validates :nombre, :rol, :presence => true,
end
