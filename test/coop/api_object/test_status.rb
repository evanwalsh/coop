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
    stub_post("/groups/#{@group.id}/statuses").with({
      headers: { 'Accept' => 'application/xml' },
      query: { status: "Testing update" }
    }).to_return({ 
      headers: { 'Location' => '/statuses/123456' } 
    })
    
    assert_equal "/statuses/123456", @status.post!("Testing update")
  end
  
  def test_post_as_cobot
    stub_post("/groups/12345/statuses").with({
      headers: { 'Accept' => 'application/xml' },
      query: { key: "BeepBoopAPIKeyGoesHere", status: "Testing update as Cobot" }
    }).to_return({ 
      headers: { 'Location' => '/statuses/123456' } 
    })
    
    assert_equal "/statuses/123456", @status.post_as_cobot!("Testing update as Cobot", "BeepBoopAPIKeyGoesHere")
  end
end