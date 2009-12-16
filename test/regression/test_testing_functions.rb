require File.dirname(__FILE__) + "/../test_helper.rb"

testing Testing::Functions do
  
  testing "determine_class_name(name)" do
    test "Horst -> Horst" do
      assert_equal Testing::Functions::determine_class_name("Horst"),  "Horst"
    end
    
    test "HorstTest -> HorstTest" do
      assert_equal Testing::Functions::determine_class_name("HorstTest"),  "HorstTest"
    end
    
    test "HorstTest Hello -> HorstTestHello" do
      assert_equal Testing::Functions::determine_class_name("HorstTest Hello"),  "HorstTestHello"
    end
    
    test "Horst test hello -> HorstTestHello" do
      assert_equal Testing::Functions::determine_class_name("Horst test hello"),  "HorstTestHello"
    end
  end
  
  testing "#make_constantizeable(string)" do
    test "returns arg if arg is not a string" do
      assert_equal Testing::Functions.make_constantizeable(1),  1
    end
    
    test "removes nonword chars" do
      assert_equal Testing::Functions.make_constantizeable("@hello"),  "hello"
    end
    
    test "removes leading numbers" do
      assert_equal Testing::Functions.make_constantizeable("11_hello"),  "_hello"
    end
    
    test "doesn't remove inline whitespace" do
      assert_equal Testing::Functions.make_constantizeable("h e l l o"),  "h e l l o"
    end
    
    test "removes leading whitespace" do
      assert_equal Testing::Functions.make_constantizeable(" hello"),  "hello"
      assert_equal Testing::Functions.make_constantizeable("1 hello"),  "hello"
      assert_equal Testing::Functions.make_constantizeable("1 1 @ hello"),  "hello"
    end
  end
end