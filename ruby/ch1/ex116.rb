require 'test/unit'

module Ex116
  class MyNum
    attr_reader :n

    def initialize(n)
      @n = n
    end

    def to(ex)
      def expt_inv(b, p, a)
        even = Proc.new {(p % 2) == 0}

        if p == 0
          return a
        else
          even.call ? expt_inv(b * b, p / 2, a) : expt_inv(b, p - 1, a * b)
        end
      end

      expt_inv(@n, ex, 1)
    end
  end

end

class Ex116Test < Test::Unit::TestCase
  include Ex116

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @my2 = MyNum.new(2)
    @my3 = MyNum.new(3)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test1
    puts "Testing #{@my2.n}"
    self.assert_equal 1, @my2.to(0)
    self.assert_equal 2, @my2.to(1)
    self.assert_equal 16, @my2.to(4)
    self.assert_equal 512, @my2.to(9)
  end

  def test2
    puts "Testing #{@my3.n}"
    self.assert_equal 81, @my3.to(4)
    self.assert_equal 243, @my3.to(5)
  end
end