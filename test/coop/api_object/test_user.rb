require 'test_helper'

class TestUser < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
  
  def test_new_object
    assert_instance_of Coop::User, Coop::User.new
  end
end