module Ex109
  def inc(x)
    x + 1
  end

  def dec(x)
    x - 1
  end

  def plus_r(a, b)
    a == 0 ? b : inc(plus_r(dec(a), b))
  end

  def plus_it(a, b)
    a == 0 ? b : plus_it(dec(a), inc(b))
  end
end

require 'test/unit'
class Ex109Test < Test::Unit::TestCase
  include Ex109

  def test_plus_r
    assert_equal(3, plus_r(1,2))
    assert_equal(3, plus_r(2,1))
    assert_equal(2, plus_r(0,2))
    assert_equal(2, plus_r(2,0))
  end

  def test_plus_it
    assert_equal(3, plus_it(1,2))
    assert_equal(3, plus_it(2,1))
    assert_equal(2, plus_it(0,2))
    assert_equal(2, plus_it(2,0))
  end

end