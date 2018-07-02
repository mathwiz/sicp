require 'test/unit'

def a_plus_abs_b_lambda(a, b)
  (lambda { |x| x>0 ? a.+(x) : a.-(x) }).call(b)
end

def a_plus_abs_b_operator(a, b)
  [b].reduce(a, b>0 ? :+ : :- )
end

def a_plus_abs_b(a, b)
  a_plus_abs_b_operator(a, b)
end

class Ex4Test < Test::Unit::TestCase

  def test_plus
    assert_equal(3, a_plus_abs_b(1,2))
    assert_equal(3, a_plus_abs_b(1,-2))
    assert_equal(1, a_plus_abs_b(-1,2))
    assert_equal(1, a_plus_abs_b(-1,-2))
  end

end