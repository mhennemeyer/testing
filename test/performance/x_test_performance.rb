require File.dirname(__FILE__) + "/../test_helper.rb"

class Thing
  def widgets
    @widgets ||= []
  end
end

def_matcher :be_in_range do |given, matcher, args|
  range = args[1] ? (args[0]..args[1]) : args[0]
  matcher.positive_msg = "expected #{given} to be in range (#{range})"
  matcher.negative_msg = "expected #{given} not to be in range (#{range})"
  range.include?(given)
end

def_matcher :have do |given, matcher, args|
  number = args[0]
  actual = given.send(matcher.msgs[0].name).length
  matcher.positive_msg = "Expected #{given} to have #{actual}, but found #{number} "
  actual == number
end

100.times do |i|
  
  testing "Matcher: be_in_range#{i}" do
    testing "With lower and upper bound seperately#{i}" do
      testing "Given value of 1 #{i}" do

        setup do
          @value = 1
        end

        test "should be in range (0,1), #{i}" do
          @value.should be_in_range(0,1)
        end

        test "should be in range (1,1), #{i}" do
          @value.should be_in_range(1,1)
        end

        test "should be in range (1,2), #{i}" do
          @value.should be_in_range(1,2)
        end

        test "should not be in range (0,0), #{i}" do
          @value.should_not be_in_range(0,0)
        end

        test "should not be in range (2,2), #{i}" do
          @value.should_not be_in_range(2,2)
        end
      end

      testing "With range (), #{i}" do
        testing "Given value of 1" do

          setup do
            @value = 1
          end

          test "should be in range (0,1), #{i}" do
            @value.should be_in_range(0..1)
          end

          test "should be in range (1,1), #{i}" do
            @value.should be_in_range(1..1)
          end

          test "should be in range (1,2), #{i}" do
            @value.should be_in_range(1..2)
          end

          test "should not be in range (0,0), #{i}" do
            @value.should_not be_in_range(0..0)
          end

          test "should not be in range (2,2), #{i}" do
            @value.should_not be_in_range(2..2)
          end
        end
      end
    end
  end


  testing "top level description block with one example, #{i}" do

    setup do
      @horst = "Horst"
    end

    test "example3, #{i}" do
      @horst.should == "Horst"
    end

    testing "second level description block, #{i}" do

      setup do
        @inge = "Inge"
      end

      test "Inge should be here, #{i}" do
        @inge.should == "Inge"
      end

      test "Horst should still be here, #{i}" do
        @horst.should == "Horst"
      end

    end
  end

  testing "Thing, #{i}" do

    setup do
      @thing = Thing.new
    end
    testing "initialized in first before,#{i}" do
      setup {}
      test "has 0 widgets, #{i}" do
        @thing.should have(0).widgets
      end
    end
  end
end