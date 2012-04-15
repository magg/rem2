class Usuario < ActiveRecord::Base
	has_one :admin, :client, :student
end
