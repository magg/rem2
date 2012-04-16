class Admin < ActiveRecord::Base
  belongs_to :usuario
  validates :nombre, :appat, :apmat, :presence => true
end
