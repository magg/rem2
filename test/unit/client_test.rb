require 'test_helper'

class ClientTest < ActiveSupport::TestCase
 test "Client form" do
product = Client.new
assert product.invalid?
assert product.errors[:nombre].any?
end

end
