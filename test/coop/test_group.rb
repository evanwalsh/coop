require 'test_helper'

class TestGroup < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
    @group = @coop.group(12345)
  end
  
  def test_group_object
    assert_instance_of Coop::Group, @group
  end
end