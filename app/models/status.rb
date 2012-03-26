class Status < ActiveRecord::Base
  has_many :stories
  validates :descripcion, :presence => true, :uniqueness => true
end
