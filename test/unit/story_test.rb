require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  test "function points must be positive" do
product = Story.new(:name => 'Log In Cliente', :status_id => '1', :descripcion => 'El sistema permite al cliente tener acceso haciendo useo de sus datos personales', :prioridad => 'Alta', :usuario => 'Panchito', :comentarios => 'Hacer uso de Cifrado')
product.functionpts = -1
assert product.invalid?
#assert_equal "must be greater than or equal to 0.01",
#product.errors[:functionpts].join('; ')

product.functionpts = 0
assert product.invalid?
#assert_equal "must be greater than or equal to 0.01",
#product.errors[:functionpts].join('; ')

product.functionpts = 1
assert product.valid?
end

end
