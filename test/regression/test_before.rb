require File.dirname(__FILE__) + "/../test_helper.rb"

testing "top level" do
  
  setup do
    @horst = "Horst"
  end
  
  test "example1" do
    assert_equal @horst, "Horst"
  end
  
  testing "second level" do
    
    setup do
      @inge = "Inge"
      @horst = "NoHorst!"
    end
    
    test "there should be no horst" do
      assert_equal @horst, "NoHorst!"
    end
    
    test "Inge should be here" do
      assert_equal @inge, "Inge"
    end  
  end
  
  test "Horst should still be Horst" do
    assert_equal @horst, "Horst"
  end
end
