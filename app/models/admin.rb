class Admin < ActiveRecord::Base
  has_one :usuario
  validates :nombre, :appat, :apmat, :presence => true
end
