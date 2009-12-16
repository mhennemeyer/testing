require File.dirname(__FILE__) + "/../test_helper.rb"

class MyTestCase < Test::Unit::TestCase
  def hello
    "hello"
  end
end

testing "Custom TestCase", :type => MyTestCase do
  test "says hello" do
    assert_equal hello, "hello"
  end
end

testing "default test" do
  
  def test_a_thing
    assert true
  end
  
  test "a" do
    assert true
  end
end