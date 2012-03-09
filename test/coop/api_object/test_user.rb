require 'test_helper'

class TestUser < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
    @user = Coop::User.new({ group_id: 12345 })
  end
  
  def test_new_object
    assert_instance_of Coop::User, @user
  end
  
  def test_all
    stub_get("/group/12345/users").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('users.json')
    })
    
    assert_instance_of Array, @user.all
  end
  
  def test_find
    stub_get("/users/12345").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('user.json')
    })
    
    assert_instance_of Coop::APIObject, Coop::User.find(12345)
  end
end