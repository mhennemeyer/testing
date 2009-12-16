# remove rails root if already existing

current_dir = File.expand_path(File.dirname(__FILE__))

`cd #{current_dir} && rm -rf rails_root`

# generate rails app

# generate models, controllers, helpers, mailers

# require rails_test_helper
require File.dirname(__FILE__) + "/rails_root/test/test_helper.rb"
# require speccify

# describe ...

testing MyModelsController, :type => ActionController::TestCase do
  test "should get index" do
     get :index
     @response.should be_success
     assigns(:my_models).should_not be_nil
   end

   testing "nested context" do
     test "should still work" do
       get :index
       @response.should be_success
       assigns(:my_models).should_not be_nil
     end
   end

   test "knows about my_models_path" do
     my_models_path.should eql("/my_models")
   end
end

module MyModelsHelper
  def helper_method
    '<be value="helpful" />'
  end
end

testing MyModelsHelper, :type => ActionView::TestCase do

  test "is helpful" do
    helper_method.should =~ /helpful/
  end
  
  testing "nested context" do
    test "is still helpful" do
      helper_method.should =~ /helpful/
    end
  end
  
end