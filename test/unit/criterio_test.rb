require 'test_helper'

class CriterioTest < ActiveSupport::TestCase
test "Criterio form" do
product = Criterio.new
assert product.invalid?
assert product.errors[:descripcion].any?

end

end
