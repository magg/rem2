require 'test_helper'

class AdminTest < ActiveSupport::TestCase
test "admin form" do
product = Admin.new
assert product.invalid?
assert product.errors[:nombre].any?
end

end
