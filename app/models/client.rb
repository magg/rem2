class Client < ActiveRecord::Base
	belongs_to :usuario
	has_many :projects
	attr_accessible :nombre,:appat,:apmat, :usuario_attributes
  validates :nombre, :appat, :apmat, :presence => true
  validates_associated :usuario
  accepts_nested_attributes_for :usuario, :reject_if => lambda { |a| a[:content].blank? }
end
