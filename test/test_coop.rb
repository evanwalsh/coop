require 'test_helper'

class TestCoop < MiniTest::Unit::TestCase
  def setup
    @coop = Coop.new("test@example.com", "password")
  end
end