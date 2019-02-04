require 'test/unit'

module Ex113
  def fib(n)
    n < 2 ? n : ((psi(n) - phi(n)) / Math.sqrt(5)).round
  end

  def psi(n)
    ((1 + Math.sqrt(5)) / 2) ** n
  end

  def phi(n)
    ((1 - Math.sqrt(5)) / 2) ** n
  end
end

class Ex113Test < Test::Unit::TestCase
  include Ex113

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

  def test_fib
    assert(fib(0) == 0)
    assert(fib(1) == 1)
    assert(fib(2) == 1)
    assert(fib(3) == 2)
    assert(fib(4) == 3)
    assert(fib(5) == 5)
    assert(fib(10) == 55)
    assert(fib(15) == 610)
  end
end