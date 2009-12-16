require File.dirname(__FILE__) + "/../test_helper.rb"

module Hello
  def hello
    "Hello"
  end
end

testing "Scoping" do
  include Hello
  test "has access to included module" do
    assert_equal hello, "Hello"
  end
  
  testing "in nested context" do
    test "has access to included module" do
      assert_equal hello, "Hello"
    end
  end
end

testing "Methods defined in context" do
  
  def meth2
    "meth2"
  end
  
  test "has access to method defined in context" do
    assert_equal meth2, "meth2"
  end

  testing "in nested context" do
    test "has access to method defined in parent context" do
      assert_equal meth2, "meth2"
    end
  end
end


