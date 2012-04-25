class Student < ActiveRecord::Base
  has_many :tasks
  belongs_to :team
  belongs_to :usuario
  attr_accessible :nombre, :rol, :usuario_attributes, :team_id
  validates :nombre, :rol,:presence => true
  validates_associated :usuario
  accepts_nested_attributes_for :usuario, :reject_if => lambda { |a| a[:content].blank? }
end
