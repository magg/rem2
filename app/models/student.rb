class Student < ActiveRecord::Base
  has_many :tasks
  has_one :team
  belongs_to :usuario
  attr_accessible :nombre, :rol,:appat,:apmat, :usuario_attributes, :team_id
  validates :nombre, :rol,:appat,:apmat, :presence => true
  validates_associated :usuario
  accepts_nested_attributes_for :usuario, :reject_if => lambda { |a| a[:content].blank? }
end
