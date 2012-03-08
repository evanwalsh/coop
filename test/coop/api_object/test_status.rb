require 'test_helper'

class TestStatus < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
  
  def test_new_object
    assert_instance_of Coop::Status, Coop::Status.new
  end
end