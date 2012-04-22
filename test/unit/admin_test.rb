require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "admins attributes must not be empty" do
	usuario = Admin.new
	assert usuario.invalid?
	assert usuario.errors[:nombre].any?
	assert usuario.errors[:appat].any?
	assert usuario.errors[:apmat].any?
	#assert usuario.errors[:usuario_id].any?

end
end
