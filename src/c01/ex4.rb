require 'test/unit'


def a_plus_abs_b(a, b)
  (b > 0 ? lambda {a + b} : lambda {a - b}).call()
end

class Ex4Test < Test::Unit::TestCase

  def test_plus
    assert_equal(3, a_plus_abs_b(1,2))
    assert_equal(3, a_plus_abs_b(1,-2))
    assert_equal(1, a_plus_abs_b(-1,2))
    assert_equal(1, a_plus_abs_b(-1,-2))
  end

end