require 'test_helper'

class TestGroup < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
  
  def test_new_object
    assert_instance_of Coop::Group, Coop::Group.new
  end
end