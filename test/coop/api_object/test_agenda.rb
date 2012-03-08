require 'test_helper'

class TestAgenda < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
  
  def test_new_object
    assert_instance_of Coop::Agenda, Coop::Agenda.new
  end
end