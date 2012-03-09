require 'test_helper'

class TestStatus < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
    @group = @coop.group(12345)
    @status = Coop::Status.new({ group_id: 12345 })
  end
  
  def test_new_object
    assert_instance_of Coop::Status, @status
  end
  
  def test_group_id_access
    assert_equal @status.group_id, 12345
  end
  
  def test_post
    assert_instance_of String, @status.post!("Testing update")
  end
  
  def test_post_as_cobot
    assert_instance_of String, @status.post_as_cobot!("Testing update as Cobot", "BeepBoopAPIKeyGoesHere")
  end
end