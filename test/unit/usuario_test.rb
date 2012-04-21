require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
test "usuario attributes must not be empty" do
	usuario = Usuario.new
	assert usuario.invalid?
	assert usuario.errors[:username].any?
	assert usuario.errors[:password].any?
	#assert usuario.errors[:tipo].any?
	assert usuario.errors[:email].any?
end


end
