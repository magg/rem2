require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
test "project form" do
product = Project.new
assert product.invalid?
assert product.errors[:nombre].any?
assert product.errors[:descripcion].any?
assert product.errors[:periodo].any?
end

end
