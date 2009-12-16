require File.dirname(__FILE__) + "/../test_helper.rb"

testing "Prevent tests from beeing handed down" do
  test "test test" do
    assert true
  end
  
  $testcase = self
  test "does not inherit tests" do
    assert !$testcase.instance_methods.include?(:test_test_test)
  end
  
  test "doesn't make testname unusable" do
    assert true
  end
  
  testing "context" do
    
    setup do
      @var_from_nesting = 1
    end
    $testcase = self
    test "does not inherit tests from outer description block" do
      assert !$testcase.instance_methods.include?(:test_does_not_inherit_tests)
    end
    
    test "does not inherit tests from outer description block that are defined after nesting" do
      assert !$testcase.instance_methods.include?(:test_does_not_inherit_tests_that_are_defined_after_nesting)
    end
      
    test "doesn't make testname unusable" do
      assert true
    end
  end
  
  test "does not inherit tests that are defined after nesting" do
    assert_nil @var_from_nesting
  end
end