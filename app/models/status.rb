class Status < ActiveRecord::Base
  validates :descripcion, :presence => true, :uniqueness => true
  has_many :stories
end
