class Admin < ActiveRecord::Base
  belongs_to :usuario
  attr_accessible :nombre, :usuario_attributes
  validates :nombre, :presence => true
  validates_associated :usuario
  accepts_nested_attributes_for :usuario, :reject_if => lambda { |a| a[:content].blank? }
end
