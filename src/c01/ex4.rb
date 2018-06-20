require 'test/unit'


def a_plus_abs_b(a, b)
  plus = lambda {|x,y| x + y}
  minus = lambda {|x,y| x - y}
  (b > 0 ? plus : minus).call(a,b)
end

class Ex4Test < Test::Unit::TestCase

  def test_plus
    assert_equal(3, a_plus_abs_b(1,2))
    assert_equal(3, a_plus_abs_b(1,-2))
    assert_equal(1, a_plus_abs_b(-1,2))
    assert_equal(1, a_plus_abs_b(-1,-2))
  end

end