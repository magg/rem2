require 'test_helper'

class TaskTest < ActiveSupport::TestCase
test "Task test" do
product = Task.new
assert product.invalid?
assert product.errors[:descripcion].any?
assert product.errors[:estimadoinicial].any?
end

end
