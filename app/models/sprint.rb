class Sprint < ActiveRecord::Base
  has_and_belongs_to_many :stories
  validates :comentario, :presence => true, :length => { 
     :minimum => 6, 
     :message => :too_short 
   }
end
