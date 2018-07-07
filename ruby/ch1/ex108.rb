require 'test/unit'

def square(x)
  x * x
end

def cube(x)
  x * x * x
end

def improve(guess, x)
  (x / square(guess) + 2 * guess) / 3.0
end

def good_enough?(guess, x)
  (cube(guess) - x).abs < (guess / 100000.0)
end

def cbrt_iter(guess, x)
  good_enough?(guess, x) ? guess : cbrt_iter(improve(guess, x), x)
end

def cbrt(x)
  cbrt_iter(1.0, x)
end

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @delta = 0.0001
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_1
    assert_in_delta(27.0, cube(cbrt(27.0)), @delta)
  end

  def test_2
    assert_in_delta(0.02, cube(cbrt(0.02)), @delta)
    assert_in_delta(0.0002, cube(cbrt(0.0002)), @delta)
  end

end