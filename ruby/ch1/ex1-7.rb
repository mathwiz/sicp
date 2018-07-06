require 'test/unit'

def square(x)
  x * x
end

def average(x, y)
  (x + y) / 2.0
end

def improve(guess, x)
  average(guess, x / guess)
end

def good_enough?(guess, x)
  (square(guess) - x).abs < (guess / 100000.0)
end

def sqrt_iter(guess, x)
  good_enough?(guess, x) ? guess : sqrt_iter(improve(guess, x), x)
end

def sqrt(x)
  sqrt_iter(1.0, x)
end

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @delta = 0.000001
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_1
    assert_in_delta(Math::sqrt(0.2), sqrt(0.2), @delta)
  end

  def test_2
    assert_in_delta(Math::sqrt(0.02), sqrt(0.02), @delta)
    assert_in_delta(Math::sqrt(0.0002), sqrt(0.0002), @delta)
  end

end