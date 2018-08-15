require 'test/unit'

module Ex111
  def f_rec(n)
    n < 3 ? n : f_rec(n - 1) + 2 * f_rec(n - 2) + 3 * f_rec(n - 3)
  end

  def f_it(n)
    n < 3 ? n : f_it_helper(2, 1, 0, n)
  end

  def f_it_helper(a, b, c, n)
    n == 3 ? f_single(a, b, c) : f_it_helper(f_single(a, b, c), a, b, n - 1)
  end

  def f_single(a, b, c)
    a + 2 * b + 3 * c
  end
end

class Ex111Test < Test::Unit::TestCase
  include Ex111

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_1
    assert(f_rec(0) == 0)
    assert(f_rec(1) == 1)
    assert(f_rec(2) == 2)
    assert(f_rec(3) == 4)
    assert(f_rec(4) == 11)
  end

  def test_2
    assert(f_rec(4) == f_it(4))
    assert(f_rec(8) == f_it(8))
    assert(f_rec(16) == f_it(16))
  end
end