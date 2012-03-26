class Task < ActiveRecord::Base
   has_one :story
   has_one :student
   has_many :workdetails
   validates :descripcion, :presence => true, :length => { 
      :minimum => 6, 
      :message => :too_short 
    }
    validates :estimadoinicial, :numericality => true
    validates :status, :presence => true
    
end
