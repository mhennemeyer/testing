require File.dirname(__FILE__) + "/../test_helper.rb"
require 'rubygems'
require 'mocha'

testing "Testing with mocha" do
  test "verifies expectations" do
    @var = Object.new
    @var.expects(:hello)
    @var.hello
  end
  
  test "still works" do
    assert_equal 1, 1
  end
end