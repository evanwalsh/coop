require 'test_helper'

class TestAPIObject < MiniTest::Unit::TestCase
  def setup
    @object = APIObject.new
  end
  
  def test_new_is_session
    assert_instance_of Coop::Session, @coop
  end
  
  def test_group_object
    assert_instance_of Coop::Group, @coop.group(12345)
  end
end