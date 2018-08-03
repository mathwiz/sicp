require 'test/unit'

module Ex110
  def a(x, y)
    case y
    when 0
      0
    when 1
      2
    else
      x == 0 ? 2 * y : a(x - 1, a(x, y - 1))
    end
  end

  def f(n)
    a(0, n)
  end

  def g(n)
    a(1, n)
  end

  def h(n)
    a(2, n)
  end

  def k(n)
    5 * n * n
  end
end


class MyTest < Test::Unit::TestCase
  include Ex110

  def test_1
    assert_equal(1024, a(1, 10))
    assert_equal(65536, a(2, 4))
    assert_equal(65536, a(3, 3))
    assert_equal(8, f(4))
    assert_equal(156, f(78))
    assert_equal(16, g(4))
    assert_equal(65536, h(4))
  end
end