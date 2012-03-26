class Student < ActiveRecord::Base
  has_many :tasks
  validates :nombre, :rol, :presence => true,
end
