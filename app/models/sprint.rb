class Sprint < ActiveRecord::Base
 has_many :sprintstories
 has_many :stories, :through => :sprintstories
 validates :comentario, :presence => true, :length => { 
    :minimum => 6, 
    :message => :too_short 
  }
end
