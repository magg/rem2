require 'test_helper'

class SprintTest < ActiveSupport::TestCase
test "sprint form" do
product = Sprint.new
assert product.invalid?
assert product.errors[:comentario].any?
assert product.errors[:fechainicio].any?
assert product.errors[:fechafin].any?
end

end
