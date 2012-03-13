class Status < ActiveRecord::Base
  validates :descripcion, :presence => true
end
