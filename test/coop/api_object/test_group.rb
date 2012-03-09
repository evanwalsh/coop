require 'test_helper'

class TestGroup < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
    @group = @coop.group(12345)
  end
  
  def test_new_object
    assert_instance_of Coop::Group, Coop::Group.new
  end
  
  def test_session_proxy
    assert_instance_of Coop::Group, @group
  end
  
  def test_statuses
    assert_instance_of Coop::Status, @group.statuses
  end
  
  def test_set_group_id_on_status
    assert_equal @group.statuses.group_id, @group.id
  end
  
  def test_post
    assert_instance_of String, @group.post!("Testing update")
  end
  
  def test_post_as_cobot
    assert_instance_of String, @group.post_as_cobot!("Testing update as Cobot", "BeepBoopAPIKeyGoesHere")
  end
end