require 'test_helper'

class TestAgenda < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
    @agenda = Coop::Agenda.new({ group_id: 12345 })
  end
  
  def test_new_object
    assert_instance_of Coop::Agenda, @agenda
  end
  
  def test_global
    stub_get("/groups/12345/agenda").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('agenda.json')
    })
    
    assert_instance_of Coop::APIObject, @agenda.global
  end
  
  def test_users
    stub_get("/groups/12345/user_agendas").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('user_agendas.json')
    })
    
    assert_instance_of Array, @agenda.users
  end
  
  def test_user
    stub_get("/groups/12345/my_agenda").with({
      headers: { 'Accept' => 'application/json' }
    }).to_return({
      body: fixture('my_agenda.json')
    })
    
    assert_instance_of Coop::APIObject, @agenda.user
  end
end