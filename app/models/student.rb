class Student < ActiveRecord::Base
  has_many :tasks
end
