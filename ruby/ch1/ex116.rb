require 'test/unit'

module Ex116
  class MyNum
    attr_reader :n

    def initialize(n)
      @n = n
    end

    def expt_inv(p, a)
      puts "* expt_inv with n=#{@n}, p=#{p}, a=#{a}"
      if p == 0
        a
      elsif p % 2 == 0
        MyNum.new(@n * @n).expt_inv(p / 2, a)
      else
        expt_inv(p - 1, a * @n)
      end
    end

    def to(p)
      puts "Raising #{@n} to #{p}"
      expt_inv(p, 1)
    end
  end

end

class MyTest < Test::Unit::TestCase
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