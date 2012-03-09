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
  
  def test_recent
    stub_get("/groups/12345/statuses").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('statuses.json')
    })

    assert_instance_of Array, @status.recent
  end
  
  def test_where_user
    stub_get("/groups/12345/users/12345").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('statuses_for_user.json')
    })
    
    assert_instance_of Array, @status.where({ user_id: 12345 })
  end
  
  def test_where_date
    stub_get("/groups/12345/20120303").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('statuses_for_user.json')
    })
    
    assert_instance_of Array, @status.where({ date: Date.new(2012, 03, 03) })
  end
  
  def test_where_user_and_date
    stub_get("/groups/12345/users/12345/20120303").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('statuses_for_user.json')
    })
    
    assert_instance_of Array, @status.where({ user_id: 12345, date: Date.new(2012, 03, 03) })
  end
end