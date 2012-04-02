require 'test_helper'

class TestSession < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end

  def test_new_is_session
    assert_instance_of Coop::Session, @coop
  end

  def test_group
    @group = @coop.group(12345)
    assert_instance_of Coop::Group, @group
  end

  def test_groups
    stub_get("/groups").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('groups.json')
    })

    assert_instance_of Array, @coop.groups
  end
end