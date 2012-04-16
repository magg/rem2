class Student < ActiveRecord::Base
  has_many :tasks
<<<<<<< HEAD
  has_one :team, :usuario
  validates :nombre, :appat, :apmat, :rol, :presence => true
=======
  has_one :team
  belongs_to :usuario
  attr_accessible :nombre, :rol,:appat,:apmat, :usuario_attributes
  
  validates :nombre, :rol,:appat,:apmat, :presence => true
  
  validates_associated :usuario
  
  accepts_nested_attributes_for :usuario, :reject_if => lambda { |a| a[:content].blank? }
  
  
>>>>>>> students
end
