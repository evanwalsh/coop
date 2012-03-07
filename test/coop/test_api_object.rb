require 'test_helper'

class TestAPIObject < MiniTest::Unit::TestCase
  def setup
    @object = APIObject.new({
      test: true,
      name: "object",
      value: "APIObject",
      arbitrary_key: "this"
    })
  end
  
  def test_new
    assert_instance_of APIObject, @object
  end
  
  def test_mash
    assert_equal true, @object.test
    assert_equal "object", @object.name
    assert_equal "APIObject", @object.value
    assert_equal "this", @object.arbitrary_key
  end
end