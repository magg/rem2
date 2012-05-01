require 'test_helper'

class StatusTest < ActiveSupport::TestCase
test "Status form" do
product = Status.new
assert product.invalid?
assert product.errors[:descripcion].any?
end

end
