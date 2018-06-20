require 'test/unit'
require_relative 'functions'

def larger_sq(x, y, z)
  case [x,y,z].min
  when x
    sum_squares([y,z])
  when y
    sum_squares([x,z])
  else
    sum_squares([x,y])
  end
end


class Test1 < Test::Unit::TestCase
  def test_sum_squares
    assert_equal(14, sum_squares([1,2,3]))
  end

  def test_larger_sq
    assert_equal(25, larger_sq(2,3,4))
    assert_equal(41, larger_sq(5,3,4))
    assert_equal(2, larger_sq(1,1,1))
  end
end

