class Task < ActiveRecord::Base
   has_one :story
   has_one :student
   has_many :workdetails
end
