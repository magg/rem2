require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "team form" do
product = Team.new
assert product.invalid?
assert product.errors[:nombre].any?
end

end
