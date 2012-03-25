class Sprint < ActiveRecord::Base
 has_many :sprintstories
 has_many :stories, :through => :sprintstories
end
