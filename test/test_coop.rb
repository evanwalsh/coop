require 'test_helper'

class TestCoop < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
  
  def test_factory
    puts @coop.inspect
  end
end