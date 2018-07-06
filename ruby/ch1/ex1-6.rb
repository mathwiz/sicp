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
  (square(guess) - x).abs < 0.001
end

def sqrt_iter(guess, x)
  good_enough?(guess, x) ? guess : sqrt_iter(improve(guess, x), x)
end

def sqrt(x)
  sqrt_iter(1.0, x)
end

def bad_sqrt_iter(guess, x)
  new_if good_enough?(guess, x), guess, bad_sqrt_iter(improve(guess, x), x)
end

def bad_sqrt(x)
  bad_sqrt_iter(1.0, x)
end

def new_if(predicate, then_clause, else_clause)
  predicate ? then_clause : else_clause
end

class MyTest < Test::Unit::TestCase

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

  def test_sqrt
    assert_in_delta(1.414, sqrt(2), 0.001)
  end

  def test_bad_sqrt
    omit("raises SystemStackError")
    assert_in_delta(1.414, sqrt(2), 0.001)
  end

end