class Workdetail < ActiveRecord::Base
 has_one :task
 validates :hrstrabajadas, :hrsporterminar, :numericality => true
 
end
