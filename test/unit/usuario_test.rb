require 'test_helper'
class UsuarioTest < ActiveSupport::TestCase
test "product attributes must not be empty" do
product = Usuario.new
assert product.invalid?
assert product.errors[:username].any?
assert product.errors[:password].any?
assert product.errors[:email].any?
end

end
