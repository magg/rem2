require 'test_helper'

class WorkdetailTest < ActiveSupport::TestCase
test "workdetail form" do
product = Workdetail.new
assert product.invalid?
assert product.errors[:hrstrabajadas].any?
assert product.errors[:hrsporterminar].any?
end

end
