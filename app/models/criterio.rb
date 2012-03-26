class Criterio < ActiveRecord::Base
  has_many :stories
  validates :descripcion, :presence => true, :length => { 
     :minimum => 6, 
     :message => :too_short 
   }
end
