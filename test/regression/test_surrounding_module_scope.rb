require File.dirname(__FILE__) + "/../test_helper.rb"

module Hello
  module Again
    def hello_again
      "hello_again"
    end
  end
end

module Hello
  module Again
    testing "Surrounding Module" do
      test "has access to surrounding module" do
        assert_equal hello_again, "hello_again"
      end

      testing "in nested context" do
        test "has access to surrounding module" do
          assert_equal hello_again, "hello_again"
        end
      end
    end
  end
end